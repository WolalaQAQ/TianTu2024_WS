/*
 * @Description: 车辆决策程序，发布geometry_msgs::PoseStamped格式信息
 * @Author: SkyWalker
 * @Date: 2024.6.16
 */
#include <iostream>
#include "ros/ros.h"
#include "geometry_msgs/PoseStamped.h"
#define POINTNUM 5

using namespace std;

ros::Publisher posePub;

void moveCarTo(float x, float y, float z);

int main(int argc, char **argv)
{
    ros::init(argc, argv, "car_decision");
    ros::NodeHandle nh;

    posePub = nh.advertise<geometry_msgs::PoseStamped>("moveit_base/nav_goal", 1);

    // 设置五组点位的坐标，假设是简单的整数值
    float points[POINTNUM][3] = {
        {1.3347554206848145, -0.7557542324066162, 0.0},
        {3.8800299167633057, -1.1198943853378296, 0.0},
        {5.98182487487793, 0.8294860124588013, 0.0},
        {3.790919065475464, 1.2395868301391602, 0.0},
        {1.401595115661621, 1.4355823993682861, 0.0}
    };
    int currentPointIndex = 0;

    ros::Rate rate(0.2); // 控制每5秒换一个目标点位

    while (ros::ok())
    {
        moveCarTo(points[currentPointIndex][0], points[currentPointIndex][1], points[currentPointIndex][2]);

        currentPointIndex = (currentPointIndex + 1) % POINTNUM;

        rate.sleep();
    }

    return 0;
}

void moveCarTo(float x, float y, float z)
{
    geometry_msgs::PoseStamped poseMsg;
    poseMsg.header.stamp = ros::Time::now();
    poseMsg.header.frame_id = "map"; // 坐标系为map

    poseMsg.pose.position.x = x;
    poseMsg.pose.position.y = y;
    poseMsg.pose.position.z = z;

    posePub.publish(poseMsg);

    cout << "Moving car to point (" << x << ", " << y << ", " << z << ")" << endl;
}
