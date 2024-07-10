//
// Created by wolala on 24-6-19.
//

#ifndef BUILD_SRC_YOLO_DETECTOR_INCLUDE_YOLO_DETECTOR_YOLO_DETECTOR_NODE_H

#include <filesystem>

#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <ros/ros.h>
#include <std_msgs/Bool.h>
#include <yolo_detector/StartDetect.h>

#include "yolo_detector/yolov8.h"

enum ObjectType {
	BAD = 0,
	BOX = 1,
	GOOD = 2
};

struct Box {
	OutputParams output_params;
	std::vector<OutputParams> bad_cards;
	std::vector<OutputParams> good_cards;
};

class YoloDetectorNode {
public:
	YoloDetectorNode() = delete;
	explicit YoloDetectorNode(ros::NodeHandle &nh);

private:
	ros::NodeHandle nh_;
	image_transport::ImageTransport it_;
	image_transport::Subscriber image_raw_sub_;

	image_transport::Publisher image_marked_pub_;
	image_transport::Publisher image_filtered_pub_;

	ros::ServiceServer start_detect_service_;

	std::string model_path_;
	bool save_marker_image_;
	std::filesystem::path image_save_path_;
	Yolov8 detector_;

	sensor_msgs::ImageConstPtr latest_img_;
	std::mutex image_mtx_;

	int detect_count_ = 0;

	std::vector<OutputParams> filterResult(const std::vector<OutputParams> &results, bool left_to_right);

	void getImageCallback(const sensor_msgs::ImageConstPtr &msg);
	bool startDetectCallback(yolo_detector::StartDetect::Request &req, yolo_detector::StartDetect::Response &res);

};

#define BUILD_SRC_YOLO_DETECTOR_INCLUDE_YOLO_DETECTOR_YOLO_DETECTOR_NODE_H

#endif//BUILD_SRC_YOLO_DETECTOR_INCLUDE_YOLO_DETECTOR_YOLO_DETECTOR_NODE_H
