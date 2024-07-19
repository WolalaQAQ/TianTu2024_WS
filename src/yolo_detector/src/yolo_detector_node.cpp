#include "yolo_detector/yolo_detector_node.h"

#include "yolo_detector/BoxInfo.h"
#include "yolo_detector/DetectInfo.h"

YoloDetectorNode::YoloDetectorNode(ros::NodeHandle &nh) : nh_(nh), it_(nh) {
	nh_.getParam("/yolo_detector/model_path", model_path_);
	nh_.getParam("/yolo_detector/save_marker_image", save_marker_image_);
	std::string image_save_path;
	nh_.getParam("/yolo_detector/save_image_path", image_save_path);
	image_save_path_ = std::filesystem::path(image_save_path);

	ROS_INFO("Model path = %s, Save Marker Image = %d, Image Save Path = %s",
			 model_path_.c_str(),
			 save_marker_image_,
			 image_save_path.c_str());
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

bool YoloDetectorNode::startDetectCallback(yolo_detector::StartDetect::Request &req,
										   yolo_detector::StartDetect::Response &res) {
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
	auto filtered_result_ = filterResult(filteredImg, output, req.left_to_right, req.second_shelf, req.qualifier);
	detector_.DrawResult(filteredImg, filtered_result_, false);
	//	if (filtered_result_.size() < 6) {
	//		ROS_ERROR("Invalid box info size!");
	//		res.success = false;
	//		return false;
	//	}

	if (save_marker_image_) {
		// 转换成YYYY/MM/DD HH:MM:SS格式
		time_t now = time(nullptr);
		tm *ltm = localtime(&now);
		char time_str[20];
		strftime(time_str, sizeof(time_str), "%Y%m%d%H%M%S", ltm);

		std::filesystem::path raw_image_save_path =
			image_save_path_ / (std::string(time_str) + "_raw_" + std::to_string(detect_count_) + ".jpg");
		std::filesystem::path marker_image_save_path =
			image_save_path_ / (std::string(time_str) + "_marker_" + std::to_string(detect_count_) + ".jpg");
		std::filesystem::path filtered_image_save_path =
			image_save_path_ / (std::string(time_str) + "_filtered_" + std::to_string(detect_count_) + ".jpg");
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

std::vector<OutputParams> YoloDetectorNode::filterResult(cv::Mat &img,
														 const std::vector<OutputParams> &results,
														 bool left_to_right,
														 bool second_shelf,
														 bool qualifier) {
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

	// 使用partial_sort，选取距离基点最近的前top_num个箱子
	auto top_num = 6;
	auto top_boxes = boxes;
	std::vector<OutputParams> top_2;
	if (top_boxes.size() > top_num) {
		std::partial_sort(top_boxes.begin(), top_boxes.begin() + top_num, top_boxes.end(), [left_to_right, this](const OutputParams &a, const OutputParams &b) {
			cv::Point2i base_point;
			if (left_to_right) {
				base_point = cv::Point2i(0, 0);
			} else {
				base_point = cv::Point2i(this->latest_img_->width, 0);
			}
			cv::Point2i center_a = (a.box.tl() + a.box.br()) / 2;
			cv::Point2i center_b = (b.box.tl() + b.box.br()) / 2;
			auto distance_a = cv::norm(center_a - base_point);
			auto distance_b = cv::norm(center_b - base_point);
			return distance_a < distance_b;
		});
		top_boxes.resize(top_num);
	}

	// 选取top_boxes中y轴最小的两个箱子，作为top_2
	top_2 = top_boxes;
	std::sort(top_2.begin(), top_2.end(), [](const OutputParams &a, const OutputParams &b) {
		return a.box.y < b.box.y;
	});
	if (top_2.size() > 3) {
		top_2.resize(3);
	}

	auto min_y_box = top_2[0];
	// 删除top_2中离min_y_box在y轴上距离大于一定阈值的箱子
	top_2.erase(
		std::remove_if(top_2.begin(), top_2.end(), [&min_y_box](const OutputParams &box) {
			return std::abs(box.box.y - min_y_box.box.y) > 60;
		}),
		top_2.end());

	std::sort(top_2.begin(), top_2.end(), [left_to_right](const OutputParams &a, const OutputParams &b) {
		if (left_to_right) {
			return a.box.x < b.box.x;
		} else {
			return a.box.x > b.box.x;
		}
	});
	if (top_2.size() > 2) {
		top_2.resize(2);
	}
	// 按x坐标排序
	std::sort(top_2.begin(), top_2.end(), [](const OutputParams &a, const OutputParams &b) {
		return a.box.x < b.box.x;
	});

	// 画top_2的两个箱子的矩形框中点连线的垂直平分线
	cv::Point2i center_1 = (top_2[0].box.tl() + top_2[0].box.br()) / 2;
	cv::Point2i center_2 = (top_2[1].box.tl() + top_2[1].box.br()) / 2;
	// 计算中点
	cv::Point midpoint((center_1.x + center_2.x) / 2, (center_1.y + center_2.y) / 2);

	// 计算垂直平分线的斜率
	double slope;
	if (center_2.x - center_1.x != 0) {
		slope = static_cast<double>(center_2.y - center_1.y) / (center_2.x - center_1.x);
	} else {
		slope = std::numeric_limits<double>::infinity();// 垂直线的斜率
	}

	// 定义垂直平分线的长度
	int line_length = 36000;
	double dx, dy;

	// 计算垂直平分线的两个端点
	if (slope != std::numeric_limits<double>::infinity()) {
		double perp_slope = -1 / slope;
		dx = line_length / std::sqrt(1 + perp_slope * perp_slope);
		dy = perp_slope * dx;
	} else {
		dx = 0;
		dy = line_length;
	}

	cv::Point pt1(midpoint.x - dx, midpoint.y - dy);
	cv::Point pt2(midpoint.x + dx, midpoint.y + dy);
	// 画原始线段
	line(img, center_1, center_2, cv::Scalar(255, 0, 0), 2);

	// 画垂直平分线
	Line vertical_bisector = {pt1, pt2};
	line(img, pt1, pt2, cv::Scalar(0, 255, 0), 2);

	// 画两个点
	circle(img, center_1, 5, cv::Scalar(0, 0, 255), -1);
	circle(img, center_2, 5, cv::Scalar(0, 0, 255), -1);

	// 画中点
	circle(img, midpoint, 5, cv::Scalar(255, 255, 255), -1);

	// 计算center_1到中点的反向延伸点
	cv::Point2i extended_center_1(center_1.x - (midpoint.x - center_1.x) - 25, center_1.y - (midpoint.y - center_1.y));

	// 计算center_2到中点的反向延伸点
	cv::Point2i extended_center_2(center_2.x - (midpoint.x - center_2.x) + 25, center_2.y - (midpoint.y - center_2.y));

	// 画延伸后的新点
	circle(img, extended_center_1, 5, cv::Scalar(255, 255, 0), -1);
	circle(img, extended_center_2, 5, cv::Scalar(255, 255, 0), -1);

	// 画延伸线段
	line(img, center_1, extended_center_1, cv::Scalar(255, 255, 0), 2);
	line(img, center_2, extended_center_2, cv::Scalar(255, 255, 0), 2);
	Line extended_center = {extended_center_1, extended_center_2};
	// 画穿过延伸点的直线
	cv::Point extended_pt1_1(extended_center_1.x + 35, 0);
	cv::Point extended_pt1_2(extended_center_1.x - 35, img.rows);

	cv::Point extended_pt2_1(extended_center_2.x - 35, 0);
	cv::Point extended_pt2_2(extended_center_2.x + 35, img.rows);

	Line extended_line1 = {extended_pt1_1, extended_pt1_2};
	cv::line(img, extended_pt1_1, extended_pt1_2, cv::Scalar(0, 255, 255), 2);
	Line extended_line2 = {extended_pt2_1, extended_pt2_2};
	cv::line(img, extended_pt2_1, extended_pt2_2, cv::Scalar(0, 255, 255), 2);

	//	cv::imshow("img", img);
	//	cv::waitKey(0);

	// 删除boxes中的top_2
	boxes.erase(
		std::remove_if(boxes.begin(), boxes.end(), [&top_2](const OutputParams &box) {
			return std::any_of(top_2.begin(), top_2.end(), [&box](const OutputParams &top) {
				return box.box.x == top.box.x && box.box.y == top.box.y;
			});
		}),
		boxes.end());

	//	for (const auto& b : boxes) {
	//		cv::circle(img, (b.box.tl() + b.box.br()) / 2, 5, cv::Scalar(0, 255, 0), -1);
	//	}

	std::vector<OutputParams> left_boxes = boxes;
	std::vector<OutputParams> right_boxes = boxes;

	Line bottom_border = {
		{0, static_cast<float>(img.rows)},
		{static_cast<float>(img.cols), static_cast<float>(img.rows)}};
	//	Line bottom_border = {extended_pt1_2, extended_pt2_2};
	cv::line(img, extended_pt1_2, extended_pt2_2, cv::Scalar(0, 255, 255), 2);

	auto bottom_box_max_size = 4;
	if (qualifier) {
		bottom_box_max_size = 2;
	}

	std::vector<cv::Point2f> left_borders = {
		getIntersection(extended_center, extended_line1),
		getIntersection(extended_center, vertical_bisector),
		getIntersection(bottom_border, vertical_bisector),
		getIntersection(bottom_border, extended_line1)};

	//	for (const auto& p : left_borders) {
	//		ROS_INFO("left_borders: %f, %f", p.x, p.y);
	//	}

	// left_boxes是矩形中心点在left_borders中的箱子
	left_boxes.erase(
		std::remove_if(left_boxes.begin(), left_boxes.end(), [&left_borders](const OutputParams &box) {
			cv::Point center = (box.box.tl() + box.box.br()) / 2.0;
			auto res = cv::pointPolygonTest(left_borders, center, false);
			if (res < 0) {
				return true;
			}
			return false;
		}),
		left_boxes.end());

	// 选取left_boxes中矩形面积最大的两个箱子
	if (left_boxes.size() > bottom_box_max_size / 2) {
		std::sort(left_boxes.begin(), left_boxes.end(), [](const OutputParams &a, const OutputParams &b) {
			return a.box.area() > b.box.area();
		});
		left_boxes.resize(bottom_box_max_size / 2);
	}

	std::vector<cv::Point2f> right_borders = {
		getIntersection(extended_center, extended_line2),
		getIntersection(extended_center, vertical_bisector),
		getIntersection(bottom_border, vertical_bisector),
		getIntersection(bottom_border, extended_line2)};

	//	for (const auto& p : right_borders) {
	//		ROS_INFO("right_borders: %f, %f", p.x, p.y);
	//	}

	// right_boxes是矩形中心点在right_borders中的箱子
	right_boxes.erase(
		std::remove_if(right_boxes.begin(), right_boxes.end(), [&right_borders](const OutputParams &box) {
			cv::Point center = (box.box.tl() + box.box.br()) / 2.0;
			auto res = cv::pointPolygonTest(right_borders, center, false);
			if (res < 0) {
				return true;
			}
			return false;
		}),
		right_boxes.end());

	// 选取right_boxes中矩形面积最大的两个箱子
	if (right_boxes.size() > bottom_box_max_size / 2) {
		std::sort(right_boxes.begin(), right_boxes.end(), [](const OutputParams &a, const OutputParams &b) {
			return a.box.area() > b.box.area();
		});
		right_boxes.resize(bottom_box_max_size / 2);
	}

	// 按照y坐标，对箱子进行排序，从上到下
	std::sort(left_boxes.begin(), left_boxes.end(), [](const OutputParams &a, const OutputParams &b) {
		return a.box.y < b.box.y;
	});
	std::sort(right_boxes.begin(), right_boxes.end(), [](const OutputParams &a, const OutputParams &b) {
		return a.box.y < b.box.y;
	});

	// 移除所有矩形框中心点不在box内的card
	std::vector<OutputParams> final_boxes;
	final_boxes.insert(final_boxes.end(), top_2.begin(), top_2.end());
	final_boxes.insert(final_boxes.end(), left_boxes.begin(), left_boxes.end());
	final_boxes.insert(final_boxes.end(), right_boxes.begin(), right_boxes.end());
	cards.erase(
		std::remove_if(cards.begin(), cards.end(), [&final_boxes](const OutputParams &card) {
			cv::Point center = (card.box.tl() + card.box.br()) / 2.0;
			bool flag;
			flag = std::none_of(final_boxes.begin(), final_boxes.end(), [&center](const OutputParams &box) {
				return box.box.contains(center);
			});
			return flag;
		}),
		cards.end());

	// 将排序后的箱子放入filteredResult中
	filteredResult.insert(filteredResult.end(), top_2.at(0));
	filteredResult.insert(filteredResult.end(), left_boxes.begin(), left_boxes.end());
	filteredResult.insert(filteredResult.end(), top_2.at(1));
	filteredResult.insert(filteredResult.end(), right_boxes.begin(), right_boxes.end());

	// 可视化
	for (auto i = 0; i < top_2.size(); i++) {
		cv::putText(img, "top" + std::to_string(i), top_2[i].box.tl(), cv::FONT_HERSHEY_PLAIN, 1, cv::Scalar(0, 0, 255), 2);
	}
	for (auto i = 0; i < left_boxes.size(); i++) {
		cv::putText(img, "left" + std::to_string(i), left_boxes[i].box.tl(), cv::FONT_HERSHEY_PLAIN, 1, cv::Scalar(0, 0, 255), 2);
	}
	for (auto i = 0; i < right_boxes.size(); i++) {
		cv::putText(img, "right" + std::to_string(i), right_boxes[i].box.tl(), cv::FONT_HERSHEY_PLAIN, 1, cv::Scalar(0, 0, 255), 2);
	}

	// 将所有的卡片放入filteredResult中
	filteredResult.insert(filteredResult.end(), cards.begin(), cards.end());

	return filteredResult;
}

cv::Point2f getIntersection(const Line &line1, const Line &line2) {
	double A1 = line1.A;
	double B1 = line1.B;
	double C1 = line1.C;
	double A2 = line2.A;
	double B2 = line2.B;
	double C2 = line2.C;

	double determinant = A1 * B2 - A2 * B1;

	if (std::fabs(determinant) < 1e-10) {// determinant is close to 0, lines are parallel or coincident
		throw std::runtime_error("The lines are parallel or coincident and do not intersect at a unique point.");
	}

	double x = (B1 * C2 - B2 * C1) / determinant;
	double y = (A2 * C1 - A1 * C2) / determinant;

	return {static_cast<float>(x), static_cast<float>(y)};
}
