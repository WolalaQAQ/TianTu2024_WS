#include "yolo_detector/yolo_detector_node.h"

YoloDetectorNode::YoloDetectorNode(ros::NodeHandle &nh) : nh_(nh), it_(nh) {
	nh.param("/yolo_detector/model_path", model_path_, std::string(""));
	ROS_INFO("Model path = %s", model_path_.c_str());
	if (model_path_.empty()) {
		ROS_ERROR("Failed to get model path!");
		throw std::runtime_error("Failed to get model path!");
	}
	if (!detector_.ReadModel(model_path_, false)) {
		ROS_ERROR("Failed to read model!");
		throw std::runtime_error("Failed to read model!");
	}

	image_raw_sub_ = it_.subscribe("image_raw", 1, &YoloDetectorNode::getImageCallback, this);

	image_marked_pub_ = it_.advertise("image_marked", 1);
	image_filtered_pub_ = it_.advertise("image_filtered", 1);

	left_to_right_sub_ =
		nh_.subscribe<std_msgs::Bool>("/decision/left_to_right", 1, &YoloDetectorNode::leftToRightCallback, this, ros::TransportHints().tcpNoDelay());
}

void YoloDetectorNode::getImageCallback(const sensor_msgs::ImageConstPtr &msg) {
	cv_bridge::CvImageConstPtr image_raw_;
	try {
		image_raw_ = cv_bridge::toCvShare(msg, "bgr8");
	} catch (cv_bridge::Exception &e) {
		ROS_ERROR("cv_bridge exception: %s", e.what());
		return;
	}

	std::vector<OutputParams> output;
	cv::Mat markedImg = image_raw_->image.clone();
	if (detector_.Detect(image_raw_->image, output)) {
		detector_.DrawResult(markedImg, output, false);
		ROS_INFO("Detect success!");
	} else {
		ROS_ERROR("Detect failed!");
	}

	if (image_marked_pub_.getNumSubscribers() > 0) {
		sensor_msgs::ImagePtr msg_marked = cv_bridge::CvImage(std_msgs::Header(), "bgr8", markedImg).toImageMsg();
		image_marked_pub_.publish(msg_marked);
		ROS_INFO("Published marked image!");
	}

	cv::Mat filteredImg = image_raw_->image.clone();
	auto filtered_result_ = filterResult(output, left_to_right_);
	detector_.DrawResult(filteredImg, filtered_result_, false);

	if (image_filtered_pub_.getNumSubscribers() > 0) {
		sensor_msgs::ImagePtr msg_filtered = cv_bridge::CvImage(std_msgs::Header(), "bgr8", filteredImg).toImageMsg();
		image_filtered_pub_.publish(msg_filtered);
		ROS_INFO("Published filtered image!");
	}

}

void YoloDetectorNode::leftToRightCallback(const std_msgs::Bool::ConstPtr &msg) {
	left_to_right_ = msg->data;
}

std::vector<OutputParams> YoloDetectorNode::filterResult(const std::vector<OutputParams> &results, bool left_to_right) {
	std::vector<OutputParams> filteredResult;

	std::vector<OutputParams> boxes;
	std::vector<OutputParams> cards;

	// 先把所有的结果分成两类，一类是箱子，一类是卡片
	for (const auto &item : results) {
		if (item.id==ObjectType::BOX) {
			boxes.emplace_back(item);
		} else if (item.id==ObjectType::GOOD || item.id==ObjectType::BAD) {
			cards.emplace_back(item);
		}
	}

	// 按照矩形框面积，对箱子进行排序，从大到小，只保留最大的9个箱子
	std::sort(boxes.begin(), boxes.end(), [](const OutputParams &a, const OutputParams &b) {
	  return a.box.area() > b.box.area();
	});

	if (boxes.size() > 9) {
		boxes.resize(9);
	}

	// 再按照x坐标，对箱子进行排序，从左到右，保留前6个箱子
	std::sort(boxes.begin(), boxes.end(), [left_to_right](const OutputParams &a, const OutputParams &b) {
	  if (left_to_right)
		  return a.box.x < b.box.x;
	  else
		  return a.box.x > b.box.x;
	});

	if (boxes.size() > 6) {
		boxes.resize(6);
	}

	// 移除所有矩形框中心点不在box内的card
	cards.erase(
		std::remove_if(cards.begin(), cards.end(), [&boxes](const OutputParams &card) {
		  cv::Point center = (card.box.tl() + card.box.br())/2.0;

		  return std::none_of(boxes.begin(), boxes.end(), [&center](const OutputParams &box) {
			return box.box.contains(center);
		  });

		}),
		cards.end()
	);

	filteredResult.insert(filteredResult.end(), boxes.begin(), boxes.end());
	filteredResult.insert(filteredResult.end(), cards.begin(), cards.end());
	return filteredResult;
}
