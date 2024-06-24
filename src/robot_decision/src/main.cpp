#include <ros/ros.h>
#include <clocale>

#include "robot_decision/robot_decision.h"

int main(int argc, char **argv) {
	setlocale(LC_ALL, "zh_CN.UTF-8");

	ros::init(argc, argv, "robot_decision");
	ros::NodeHandle nh;
	RobotDecision node(nh);
	ros::spin();
	return 0;
}