/*
 * @Description: 车辆决策程序，发布geometry_msgs::PoseStamped格式信息
 * @Author: SkyWalker
 * @Date: 2024.6.16
 */
#include <iostream>
#include "ros/ros.h"
#include "geometry_msgs/PoseStamped.h"
#define POINTNUM 7

using namespace std;

ros::Publisher posePub;

void moveCarTo(float x, float y, float z);

int main(int argc, char **argv)
{
    ros::init(argc, argv, "car_decision");
    ros::NodeHandle nh;

    posePub = nh.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal", 1);

    // 设置五组点位的坐标，假设是简单的整数值
    float points[POINTNUM][3] = {
        {3.282205820083618, 0.52344987392425537, 0.0},
        {2.487597703933716 ,-0.721109926700592, 0.0},
        {4.697877883911133, -0.3673677444458008, 0.0},
        {6.256895065307617, 2.2515382766723633, 0.0},
        {3.920581817626953, 2.0108749866485596, 0.0},
        {2.478727340698242, 1.7768797874450684, 0.0},
        {0.26249170303344727, 0.02419203519821167, 0.0}
    };
    int currentPointIndex = 0;

    ros::Rate rate(0.1); // 控制每5秒换一个目标点位
    ros::Duration(5.0).sleep();
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
