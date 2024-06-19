//
// Created by wolala on 24-6-19.
//

#ifndef BUILD_SRC_YOLO_DETECTOR_INCLUDE_YOLO_DETECTOR_YOLO_DETECTOR_NODE_H

#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <std_msgs/Bool.h>

#include "yolo_detector/yolov8.h"

enum ObjectType {
  	BAD = 0,
	BOX = 1,
	GOOD = 2
};

class YoloDetectorNode {
public:
	YoloDetectorNode() = delete;
	explicit YoloDetectorNode(ros::NodeHandle& nh);

private:
  	ros::NodeHandle nh_;
	image_transport::ImageTransport it_;

	image_transport::Subscriber image_raw_sub_;

	image_transport::Publisher image_marked_pub_;
	image_transport::Publisher image_filtered_pub_;

	ros::Subscriber left_to_right_sub_;

	std::string model_path_;
	Yolov8 detector_;

	bool left_to_right_ = true;

	std::vector<OutputParams> filterResult(const std::vector<OutputParams>& results, bool left_to_right);

	void getImageCallback(const sensor_msgs::ImageConstPtr& msg);
	void leftToRightCallback(const std_msgs::Bool::ConstPtr& msg);

};

#define BUILD_SRC_YOLO_DETECTOR_INCLUDE_YOLO_DETECTOR_YOLO_DETECTOR_NODE_H

#endif //BUILD_SRC_YOLO_DETECTOR_INCLUDE_YOLO_DETECTOR_YOLO_DETECTOR_NODE_H
