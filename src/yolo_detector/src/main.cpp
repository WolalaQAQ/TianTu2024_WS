//
// Created by wolala on 24-6-19.
//
#include <ros/ros.h>
#include <clocale>

#include "yolo_detector/yolo_detector_node.h"

int main(int argc, char **argv) {
	setlocale(LC_ALL, "zh_CN.UTF-8");

	ros::init(argc, argv, "yolo_detector_node");
	ros::NodeHandle nh;
	YoloDetectorNode node(nh);
	ros::spin();
	return 0;
}