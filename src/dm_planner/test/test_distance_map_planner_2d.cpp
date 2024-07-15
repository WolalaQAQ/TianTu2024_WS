#include <atomic>

#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Twist.h>

#include <condition_variable>
#include <iostream>

#include <jps_planner/distance_map_planner/distance_map_planner.h>

#include <jps_planner/jps_planner/jps_planner.h>
#include <yaw_controller/yaw_controller.hpp>

#include <nav_msgs/OccupancyGrid.h>
#include <nav_msgs/Path.h>
#include <nav_msgs/Odometry.h>
#include <nav_msgs/GetMap.h>

#include "./pid_tracker.h"
#include <ros/ros.h>
#include <thread>
#include <visualization_msgs/Marker.h>

#include <std_msgs/Bool.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2/utils.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <tf2_ros/transform_listener.h>

#include <sensor_msgs/Imu.h>

nav_msgs::OccupancyGrid map_msg;

std::shared_ptr<JPSPlanner<2>> planner;
std::shared_ptr<JPS::MapUtil<2>> map_util;
std::shared_ptr<DMPlanner2D> dm_planner;
PIDTracker pid_tracker(2, 0, 0.1, 1.0, 0.4, 0.2);

Eigen::Vector2d start = Eigen::Vector2d::Zero();
Eigen::Vector2d goal = Eigen::Vector2d::Zero();


ros::Publisher path_pub;

ros::Publisher sample_path_pub;

ros::Publisher dmp_path_pub;

ros::Publisher vel_cmd_pub;

ros::Subscriber odom_sub;

ros::Publisher jps_path_pub;

ros::Publisher arrival_pub;


std::atomic<bool> is_time_exceeded(false);
std::mutex plan_mutex;
std::condition_variable plan_cv;

double yaw = 0;
double yaw_imu = 0;
double arrival_threshold;
bool goal_done = true;

double target_yaw;
double Kp_yaw;
double Ki_yaw;
double dead_zone;

ros::Subscriber map_sub;

ros::Subscriber imu_sub; // 声明 IMU 订阅器

bool map_received = false;


nav_msgs::Path vec_to_path(const vec_Vecf<2> &vs) {
    nav_msgs::Path path;
    for (const auto &it: vs) {
        geometry_msgs::PoseStamped pose;
        pose.pose.position.x = it(0);
        pose.pose.position.y = it(1);
        pose.pose.position.z = 2 == 2 ? 0 : it(2);
        pose.pose.orientation.w = 1.0;
        pose.pose.orientation.x = 0.0;
        pose.pose.orientation.y = 0.0;
        pose.pose.orientation.z = 0.0;

        path.poses.push_back(pose);
    }

    return path;
}

bool plan(const Eigen::Vector2d &start, const Eigen::Vector2d &goal) {
    auto tic = std::chrono::high_resolution_clock::now();

    if (is_time_exceeded.load()) {
        ROS_ERROR("Time exceeded");

        is_time_exceeded = false;
        return false;
    }

    if (goal == Eigen::Vector2d::Zero()) {
        ROS_ERROR("Goal not set");

        return false;
    }

    // 使用JPS2D规划器进行路径规划
    if (!planner->plan(start, goal, 1, true)) {
        ROS_ERROR("Failed to plan");
        return false;
    }

    auto toc = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration<double, std::milli>(toc - tic).count();
    ROS_INFO("Planning time: %f ms", duration);

    
    // 获取规划路径
    auto path = planner->getPath();
    auto sample_path = planner->getSamplePath();

    auto path_msg = vec_to_path(path);
    path_msg.header.frame_id = "map";
    path_msg.header.stamp = ros::Time::now();
    path_pub.publish(path_msg);

    auto sample_path_msg = vec_to_path(sample_path);
    sample_path_msg.header.frame_id = "map";
    sample_path_msg.header.stamp = ros::Time::now();
    sample_path_pub.publish(sample_path_msg);

    // 设计一条直接路径,直接把起点和终点连起来
    // vec_Vecf<2> path_msg_direct;
    // path_msg_direct.push_back(start);
    // path_msg_direct.push_back(goal);

    // bool valid_dist = dm_planner->computePath(start, goal, path_msg_direct);// 

    // dm_planner->setCweight(0.5); // Set the weight of collision cost
    // dm_planner->setMap(map_util, start);            // dm_planner在规划前必须设置地图

    bool valid_dist = dm_planner->computePath(start, goal, path);

    if (valid_dist) {
      ROS_INFO("Valid distance map path");

    } else {
        ROS_ERROR("Invalid distance map path");

    }

    // auto path_dist_dmp = dm_planner->getRawPath();
    auto path_dist_dmp = dm_planner->getPath();
    
    auto path_msg_dmp = vec_to_path(path_dist_dmp);
    path_msg_dmp.header.frame_id = "map";
    path_msg_dmp.header.stamp = ros::Time::now();
    dmp_path_pub.publish(path_msg_dmp);



    static auto last_control_time = std::chrono::high_resolution_clock::now();
    auto current_control_time = std::chrono::high_resolution_clock::now();
    // 用秒为单位计算时间差
    double delta_time = std::chrono::duration<double>(current_control_time - last_control_time).count();
    auto speed = pid_tracker.speedOutput(start, goal, path_msg_dmp, delta_time);
    // speed是基于世界坐标系的速度，需要结合yaw转换到机器人坐标系下,yaw是机器人的朝向

    Eigen::Vector2d speed_robot;
    speed_robot.x() = speed.x() * cos(yaw) + speed.y() * sin(yaw);
    speed_robot.y() = -speed.x() * sin(yaw) + speed.y() * cos(yaw);
    // 错误的速度转换，应该是下面的

    geometry_msgs::Twist vel_cmd;
    vel_cmd.linear.x = speed_robot.x();
    vel_cmd.linear.y = speed_robot.y();
    //控制机器人的yaw固定朝向
    YawController yaw_controller(Kp_yaw,Ki_yaw,target_yaw, yaw_imu,dead_zone);
    float yaw_speed = 0.0;
    yaw_controller.yaw_control(yaw_imu, yaw_speed, delta_time);
    vel_cmd.angular.z = yaw_speed;
    vel_cmd_pub.publish(vel_cmd);
    last_control_time = current_control_time;


    return true;
}

void timer_plan() {
    ros::Rate loop_rate(20);
    while (ros::ok()) {
        const double currentDistance = sqrt(pow(start.x() - goal.x(), 2) + pow(start.y() - goal.y(), 2) );
        if(currentDistance<=arrival_threshold)
        {
            goal_done = true;
            std_msgs::Bool arrival_msg;
            arrival_msg.data = true;
            arrival_pub.publish(arrival_msg);
            //发布yaw控制的速度
            geometry_msgs::Twist vel_cmd;
            vel_cmd.linear.x = 0.0;
            vel_cmd.linear.y = 0.0;
            //控制机器人的yaw固定朝向
            YawController yaw_controller(Kp_yaw,Ki_yaw, target_yaw, yaw_imu,dead_zone);
            float yaw_speed = 0.0;
            static auto last_control_time_yaw = std::chrono::high_resolution_clock::now();
            auto current_control_time_yaw = std::chrono::high_resolution_clock::now();
            // 用秒为单位计算时间差
            double delta_time_yaw = std::chrono::duration<double>(current_control_time_yaw - last_control_time_yaw).count();
            yaw_controller.yaw_control(yaw_imu, yaw_speed, delta_time_yaw);
            vel_cmd.angular.z = yaw_speed;
            vel_cmd_pub.publish(vel_cmd);
            last_control_time_yaw = current_control_time_yaw;
            
        }
        if(!goal_done)
        {
            bool finished = false;
            std::thread plan_thread([&] {
                if (plan(start, goal)) {
                    ROS_INFO("Planning succeeded");

                } else {
                    ROS_ERROR("Planning failed");

                }
                std::lock_guard<std::mutex> lock(plan_mutex);
                finished = true;
                plan_cv.notify_one();
            });
            std::thread time_limit_thread([&] {
                std::unique_lock<std::mutex> lock(plan_mutex);
                if (!plan_cv.wait_for(lock, std::chrono::seconds(2), [&] { return finished; })) {
                    ROS_ERROR("Time exceeded");
                    is_time_exceeded = true;
                }
            });
            plan_thread.join();
            time_limit_thread.join();
            if (is_time_exceeded.load()) {
                is_time_exceeded = false;
                continue;
            }
        }
        

        loop_rate.sleep();
    }
}

void odom_callback(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr &msg) {
    start = Eigen::Vector2d(msg->pose.pose.position.x, msg->pose.pose.position.y);
   yaw = tf2::getYaw(msg->pose.pose.orientation);
   
}

void map_callback(const nav_msgs::OccupancyGrid::ConstPtr &msg) {
    if(!map_received)
    {
        map_msg = *msg;
        
        ROS_INFO("Got map");
        ROS_INFO("Map width: %d", map_msg.info.width);
        ROS_INFO("Map height: %d", map_msg.info.height);
        ROS_INFO("Map resolution: %f", map_msg.info.resolution);
        ROS_INFO("Map origin: %f, %f, %f", map_msg.info.origin.position.x,
                map_msg.info.origin.position.y, map_msg.info.origin.position.z);

        map_util = std::make_shared<JPS::MapUtil<2>>();
        ROS_INFO("Map Util created");

        const Eigen::Vector2d origin(map_msg.info.origin.position.x, map_msg.info.origin.position.y);
        const Eigen::Vector2i dim(map_msg.info.width, map_msg.info.height);
        const JPS::Tmap map = map_msg.data;
        const auto res = map_msg.info.resolution;

        map_util->setMap(origin, dim, map, res);
        map_util->info();
        planner->setMapUtil(map_util);
        planner->updateMap();
        dm_planner->setMap(map_util, start); 
        map_received = true;
    }
    
}

// IMU回调函数
void imu_callback(const sensor_msgs::Imu::ConstPtr &msg) {
    tf2::Quaternion quat;
    tf2::convert(msg->orientation, quat);
    yaw_imu = tf2::getYaw(quat);
    yaw_imu= float(yaw_imu);
    ROS_INFO("YAW_IMU: %f",yaw_imu);
}

int main(int argc, char **argv) {
    setlocale(LC_ALL,"");
    ros::init(argc, argv, "planner_node");
    ros::NodeHandle nh;

    ROS_INFO("Create planner node");

    arrival_threshold = 0.25;

    planner = std::make_shared<JPSPlanner<2>>(true);
    dm_planner = std::make_shared<DMPlanner2D>(true);
    
    // Set up DMP planner
    dm_planner->setCweight(0.5); // Set the weight of collision cost
    dm_planner->setPotentialRadius(Vec2f(3.81, 3.81));// Set 2D potential field radius
    dm_planner->setSearchRadius(Vec2f(3.81, 3.81)); // Set the valid search region around given path

    nh.param("/test_distance_map_planner_2d/target_yaw", target_yaw, 0.0);
    nh.param("/test_distance_map_planner_2d/Kp_yaw", Kp_yaw, 1.0);
    nh.param("/test_distance_map_planner_2d/Ki_yaw", Ki_yaw, 0.0);
    nh.param("/test_distance_map_planner_2d/dead_zone", dead_zone, 0.0);
    std::cout<<"yaw_Kp :"<<Kp_yaw<<std::endl;
    target_yaw = float(target_yaw);
    Kp_yaw = float(Kp_yaw);
    Ki_yaw = float(Ki_yaw);
    dead_zone = float(dead_zone);


    odom_sub = nh.subscribe("/amcl_pose", 1, odom_callback);

    dmp_path_pub = nh.advertise<nav_msgs::Path>("/dm/path", 1);

    path_pub = nh.advertise<nav_msgs::Path>("/jps/path", 1);

    sample_path_pub = nh.advertise<nav_msgs::Path>("/jps/sample_path", 1);

    vel_cmd_pub = nh.advertise<geometry_msgs::Twist>("/cmd_vel", 1);
    
    map_sub = nh.subscribe("/nav_map", 1, map_callback);

    imu_sub = nh.subscribe("/imu", 1, imu_callback);

	arrival_pub = nh.advertise<std_msgs::Bool>("/arrival", 1);
    
    while(ros::ok() && map_received == false) {
        static int count = 0;
        ros::spinOnce();
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
        count++;
        if(count > 100) {
            ROS_ERROR("Failed to get map");
            return -1;
        }

    }

    auto goal_sub = nh.subscribe<geometry_msgs::PoseStamped>("/move_base_simple/goal", 1, [&](const geometry_msgs::PoseStamped::ConstPtr &msg) {
        if (start == Eigen::Vector2d::Zero()) {
            ROS_ERROR("Start not set");
            return;
        }
        goal_done = false;

        goal = Eigen::Vector2d(msg->pose.position.x, msg->pose.position.y);
        ROS_INFO("Goal: %f, %f", goal.x(), goal.y());

    });


    // timer_plan另外开一个线程，用于规划
    std::thread timer_plan_thread(timer_plan);
    timer_plan_thread.detach();


    ros::spin();
    ros::shutdown();

    return 0;
}