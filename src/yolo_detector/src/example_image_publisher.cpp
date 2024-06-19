//
// Created by wolala on 24-6-19.
//
#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <opencv2/opencv.hpp>

int main(int argc, char **argv) {
	setlocale(LC_ALL, "zh_CN.UTF-8");

	ros::init(argc, argv, "example_image_publisher");
	ros::NodeHandle nh;
	image_transport::ImageTransport it(nh);
	image_transport::Publisher pub = it.advertise("image_raw", 1);

	std::string path;
	nh.getParam("/example_image_publisher/path", path);

	int is_video = -1;
	nh.getParam("/example_image_publisher/is_video", is_video);
	if (is_video == -1) {
		ROS_ERROR("Failed to get is_video!");
		return 1;
	}

	cv::Mat image;
	if (!is_video) {
		ROS_INFO("Image path = %s", path.c_str());
		image = cv::imread(path);
		if (image.empty()) {
			ROS_ERROR("Failed to open image!");
			return 1;
		}
	} else {
		ROS_INFO("Video path = %s", path.c_str());
	}

	cv::VideoCapture cap;

	ros::Rate loop_rate(1);
	while (ros::ok()) {
		if (is_video) {
			cap = cv::VideoCapture(path);
			if (!cap.isOpened()) {
				ROS_ERROR("Failed to open video!");
				return 1;
			}
			loop_rate = ros::Rate(cap.get(cv::CAP_PROP_FPS));
			while (ros::ok()) {
				cap >> image;
				if (image.empty()) {
					ROS_ERROR("Failed to read frame!");
					break;
				}
				sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
				pub.publish(msg);
				ROS_INFO("Published video frame!");
				ros::spinOnce();
				loop_rate.sleep();
			}
		} else {
			sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
			pub.publish(msg);
			ROS_INFO("Published image frame!");
			ros::spinOnce();
			loop_rate.sleep();
		}
	}

	return 0;
}