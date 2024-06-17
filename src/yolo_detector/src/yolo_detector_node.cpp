//
// Created by wolala on 24-6-17.
//
#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <sensor_msgs/Image.h>

#include "yolo_detector/yolov8.h"

int main(int argc, char **argv) {
	ros::init(argc, argv, "yolo_detector_node");
	ros::NodeHandle nh;

	ROS_INFO("Hello, YOLO Detector!");

	Yolov8 detector;
	std::string model_path = "/home/wolala/文档/TianTu_Code/TianTu2024_WS/src/yolo_detector/model/2024-6-16.onnx";
	if (!detector.ReadModel(model_path, false)) {
		ROS_ERROR("Failed to read model!");
		return -1;
	}

	image_transport::ImageTransport it(nh);
	image_transport::Publisher pub = it.advertise("/yolo_detector/marked", 1);

	cv::Mat srcImg = cv::imread("/media/wolala/NTFS1/TianTuDataset/total_dataset/images/20240504_221929_0.png");

	while (ros::ok()) {
		std::vector<OutputParams> output;
		cv::Mat markedImg = srcImg.clone();
		if (detector.Detect(srcImg, output)) {
			detector.DrawResult(markedImg, output, false);
			ROS_INFO("Detect success!");
		} else {
			ROS_ERROR("Detect failed!");
		}
		sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", markedImg).toImageMsg();
		pub.publish(msg);
		ros::Duration(0.1).sleep();
	}

	ros::spin();
	return 0;
}