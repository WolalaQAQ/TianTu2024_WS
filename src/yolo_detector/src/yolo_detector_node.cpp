#include "yolo_detector/yolo_detector_node.h"

#include "yolo_detector/BoxInfo.h"
#include "yolo_detector/DetectInfo.h"


YoloDetectorNode::YoloDetectorNode(ros::NodeHandle &nh) : nh_(nh), it_(nh) {
	nh_.getParam("/yolo_detector/model_path", model_path_);
	nh_.getParam("/yolo_detector/save_marker_image", save_marker_image_);
	std::string image_save_path;
	nh_.getParam("/yolo_detector/save_image_path", image_save_path);
	image_save_path_ = std::filesystem::path(image_save_path);

	ROS_INFO("Model path = %s, Save Marker Image = %d, Image Save Path = %s", model_path_.c_str(), save_marker_image_, image_save_path.c_str());
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

	start_detect_service_ = nh_.advertiseService("start_detect", &YoloDetectorNode::startDetectCallback, this);

}

void YoloDetectorNode::getImageCallback(const sensor_msgs::ImageConstPtr &msg) {
	std::lock_guard<std::mutex> lock(image_mtx_);
	this->latest_img_ = msg;
}

bool YoloDetectorNode::startDetectCallback(yolo_detector::StartDetect::Request &req, yolo_detector::StartDetect::Response &res) {
	std::lock_guard<std::mutex> lock(image_mtx_);
	ROS_INFO("Get detect service call with left_to_right = %d", req.left_to_right);
	if (latest_img_ == nullptr) {
		ROS_ERROR("No image received!");
		res.success = false;
		return false;
	}

	cv_bridge::CvImageConstPtr image_raw_;
	try {
		image_raw_ = cv_bridge::toCvShare(latest_img_, "bgr8");
	} catch (cv_bridge::Exception &e) {
		ROS_ERROR("cv_bridge exception: %s", e.what());
		res.success = false;
		return false;
	}

	std::vector<OutputParams> output;
	cv::Mat markedImg = image_raw_->image.clone();
	if (detector_.Detect(image_raw_->image, output)) {
		detector_.DrawResult(markedImg, output, false);
		ROS_INFO("Detect success!");
	} else {
		ROS_ERROR("Detect failed!");
		res.success = false;
		return false;
	}

	if (image_marked_pub_.getNumSubscribers() > 0) {
		sensor_msgs::ImagePtr msg_marked = cv_bridge::CvImage(std_msgs::Header(), "bgr8", markedImg).toImageMsg();
		image_marked_pub_.publish(msg_marked);
		ROS_INFO("Published marked image!");
	}

	cv::Mat filteredImg = image_raw_->image.clone();
	auto filtered_result_ = filterResult(output, req.left_to_right);
	detector_.DrawResult(filteredImg, filtered_result_, false);

	if (save_marker_image_) {
		// 转换成YYYY/MM/DD HH:MM:SS格式
		time_t now = time(nullptr);
		tm *ltm = localtime(&now);
		char time_str[20];
		strftime(time_str, sizeof(time_str), "%Y%m%d%H%M%S", ltm);

		std::filesystem::path raw_image_save_path = image_save_path_ / (std::string(time_str) + "_raw_" + std::to_string(detect_count_) + ".jpg");
		std::filesystem::path marker_image_save_path = image_save_path_ / (std::string(time_str) + "_marker_" + std::to_string(detect_count_) + ".jpg");
		std::filesystem::path filtered_image_save_path = image_save_path_ / (std::string(time_str) + "_filtered_" + std::to_string(detect_count_) + ".jpg");
		cv::imwrite(raw_image_save_path, image_raw_->image);
		cv::imwrite(marker_image_save_path, markedImg);
		cv::imwrite(filtered_image_save_path, filteredImg);
		ROS_INFO("Saved raw image to %s", raw_image_save_path.c_str());
		ROS_INFO("Saved marked image to %s", marker_image_save_path.c_str());
		ROS_INFO("Saved filtered image to %s", filtered_image_save_path.c_str());
	}

	if (image_filtered_pub_.getNumSubscribers() > 0) {
		sensor_msgs::ImagePtr msg_filtered = cv_bridge::CvImage(std_msgs::Header(), "bgr8", filteredImg).toImageMsg();
		image_filtered_pub_.publish(msg_filtered);
		ROS_INFO("Published filtered image!");
	}

	// 构造Box结构体
	std::vector<Box> boxes;
	for (const auto &item : filtered_result_) {
		if (item.id == ObjectType::BOX) {
			Box box;
			box.output_params = item;
			boxes.emplace_back(box);
		}
	}

	// 将箱子中的卡片分别放入箱子的bad_cards和good_cards中
	for (const auto &item : filtered_result_) {
		if (item.id == ObjectType::BAD || item.id == ObjectType::GOOD) {
			cv::Point center = (item.box.tl() + item.box.br()) / 2.0;
			for (auto &box : boxes) {
				if (box.output_params.box.contains(center)) {
					if (item.id == ObjectType::BAD) {
						box.bad_cards.emplace_back(item);
					} else {
						box.good_cards.emplace_back(item);
					}
				}
			}
		}
	}

	// 构造DetectInfo
	yolo_detector::DetectInfo detect_info;
	detect_info.header.stamp = ros::Time::now();
	detect_info.detect_count = detect_count_;
	for (const auto &box : boxes) {
		yolo_detector::BoxInfo box_info;
		box_info.good_count = box.good_cards.size();
		box_info.bad_count = box.bad_cards.size();
		detect_info.box_infos.emplace_back(box_info);
	}

	// 发布DetectInfo
	res.detect_info = detect_info;
	detect_count_++;

	res.success = true;
	return true;
}

std::vector<OutputParams> YoloDetectorNode::filterResult(const std::vector<OutputParams> &results, bool left_to_right) {
	std::vector<OutputParams> filteredResult;

	std::vector<OutputParams> boxes;
	std::vector<OutputParams> cards;

	// 先把所有的结果分成两类，一类是箱子，一类是卡片
	for (const auto &item : results) {
		if (item.id == ObjectType::BOX) {
			boxes.emplace_back(item);
		} else if (item.id == ObjectType::GOOD || item.id == ObjectType::BAD) {
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

	// 按照矩形长宽比筛选矩形框，不符合标准的移除
	boxes.erase(
		std::remove_if(boxes.begin(), boxes.end(), [](const OutputParams &box) {
			float ratio = (float)box.box.width / (float)box.box.height;
			return ratio > 1.25 || ratio < 2.0;
		}),
		boxes.end());

	// 再按照x坐标，对箱子进行排序，从左到右，如果left_to_right为false，则从右到左
	std::vector<OutputParams> left_3;
	std::vector<OutputParams> right_3;
	std::sort(boxes.begin(), boxes.end(), [left_to_right](const OutputParams &a, const OutputParams &b) {
		if (left_to_right) {
			return a.box.x < b.box.x;
		} else {
			return a.box.x > b.box.x;
		}
	});

	// 将排序后的箱子分别放入left_3和right_3中
	if (boxes.size() > 6) {
		boxes.resize(6);
	}
	if (left_to_right) {
		left_3 = std::vector<OutputParams>(boxes.begin(), boxes.begin() + 3);
		right_3 = std::vector<OutputParams>(boxes.begin() + 3, boxes.end());
	} else {
		right_3 = std::vector<OutputParams>(boxes.begin(), boxes.begin() + 3);
		left_3 = std::vector<OutputParams>(boxes.begin() + 3, boxes.end());
	}
	// 按照y坐标，对箱子进行排序，从上到下
	std::sort(left_3.begin(), left_3.end(), [](const OutputParams &a, const OutputParams &b) {
		return a.box.y < b.box.y;
	});
	std::sort(right_3.begin(), right_3.end(), [](const OutputParams &a, const OutputParams &b) {
		return a.box.y < b.box.y;
	});

	// 移除所有矩形框中心点不在box内的card
	cards.erase(
		std::remove_if(cards.begin(), cards.end(), [&boxes](const OutputParams &card) {
			cv::Point center = (card.box.tl() + card.box.br()) / 2.0;

			return std::none_of(boxes.begin(), boxes.end(), [&center](const OutputParams &box) {
				return box.box.contains(center);
			});
		}),
		cards.end());

	// 将排序后的箱子放入filteredResult中，先放left_3，再放right_3
	filteredResult.insert(filteredResult.end(), left_3.begin(), left_3.end());
	filteredResult.insert(filteredResult.end(), right_3.begin(), right_3.end());

	// 将所有的卡片放入filteredResult中
	filteredResult.insert(filteredResult.end(), cards.begin(), cards.end());

	return filteredResult;
}
