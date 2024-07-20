#include "robot_decision/robot_decision.h"

#include <geometry_msgs/PoseStamped.h>

#include "yolo_detector/BoxInfo.h"
#include "yolo_detector/DetectInfo.h"

RobotDecision::RobotDecision(ros::NodeHandle &nh) : nh_(nh) {
	ROS_INFO("RobotDecision Node Started");
	nh_.getParam("/target_points", target_points_flat_);
	nh_.getParam("/qualifier", qualifier_);
	ROS_INFO("Qualifier: %d", qualifier_);
	if (target_points_flat_.empty() || target_points_flat_.size() % 3 != 0) {
		ROS_ERROR("Invalid target points");
		return;
	}
	for (int i = 0; i < target_points_flat_.size(); i += 3) {
		target_points_.emplace_back(target_points_flat_[i], target_points_flat_[i + 1], target_points_flat_[i + 2]);
	}

	start_service_ = nh_.advertiseService("start_decision", &RobotDecision::startCallback, this);
	detect_client_ = nh_.serviceClient<yolo_detector::StartDetect>("start_detect");
	work_thread_ = std::make_shared<std::thread>(&RobotDecision::work, this);
	arrival_sub_ = nh_.subscribe("arrival", 1, &RobotDecision::arrivalCallback, this);
	target_pub_ = nh_.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal", 1);
	charge_service_ = nh_.advertiseService("charge_decision", &RobotDecision::chargeCallback, this);
}

RobotDecision::~RobotDecision() {
	if (work_thread_->joinable()) {
		work_thread_->join();
	}
}

void RobotDecision::work() {
	std::this_thread::sleep_for(std::chrono::seconds(3));

	ros::Rate rate(5);
	while (ros::ok()) {
		if (current_state_ == 0) {
			ROS_INFO("Current state is 0, waiting for start trigger");
		} else if (current_state_ == 1) {
			ROS_INFO("Current state is 1");
			moveToTarget();
		} else if (current_state_ == 2) {
			ROS_INFO("Current state is 2");
			startDetect();
		} else if (current_state_ == 3) {
			ROS_INFO("Current state is 3");
			saveResult();
		} else if (current_state_ == 4) {
			ROS_INFO("Current state is 4, mission completed!!!!!");
			// No operation needed, just logging the state
		} else {
			ROS_INFO("Current state is unknown");
		}
		rate.sleep();
	}
}

void RobotDecision::moveToTarget() {
	if (!moving_ && arrival_) {
		ROS_INFO("Start Moving to target point %d", mission_id_);
		if (mission_id_ == 10) {
			ROS_INFO("Change to mission 3");
			mission_id_ = 3;
		}
		geometry_msgs::PoseStamped target;
		target.header.frame_id = "map";
		target.header.stamp = ros::Time::now();
		target.pose.position.x = target_points_[mission_id_].x();
		target.pose.position.y = target_points_[mission_id_].y();
		target.pose.position.z = target_points_[mission_id_].z();
		target_pub_.publish(target);
		moving_ = true;
		arrival_ = false;// Reset arrival to false when starting to move
	} else if (moving_ && arrival_) {
		ROS_INFO("Arrived at target point %d", mission_id_);

		if (mission_id_ == 2) {
			ROS_INFO("Mission 2 is special, waiting for drone landing!");
			mission_completed_ = false;
			timer_ = nh_.createTimer(ros::Duration(90), &RobotDecision::timerCallback, this, true);
		}

		if (mission_id_ == 6) {
			ROS_INFO("All missions completed, waiting for save result");
			current_state_ = 3;
			moving_ = false;
		} else if (mission_id_ == 3) {
			ROS_INFO("Mission 3 is special, decide not to detect");
			current_state_ = 1;
			mission_id_++;
			moving_ = false;
		} else {
			current_state_ = 2;
			moving_ = false;
		}

		std::this_thread::sleep_for(std::chrono::seconds(2));
	} else if (moving_ && !arrival_) {
		ROS_INFO("Moving to target point %d", mission_id_);
		// No operation needed, just logging the state
	} else {
		ROS_INFO("Unknown state in moveToTarget");
	}
}

void RobotDecision::startDetect() {
	ROS_INFO("Start Detecting for mission %d", mission_id_);
	yolo_detector::StartDetect srv;
	if (qualifier_) {
		srv.request.qualifier = true;
	} else {
		srv.request.qualifier = false;
	}

	if (mission_id_ == 0) {
		srv.request.left_to_right = true;
		srv.request.second_shelf = false;
	} else if (mission_id_ == 5) {
		srv.request.left_to_right = true;
		srv.request.second_shelf = true;
	} else if (mission_id_ == 1) {
		srv.request.left_to_right = false;
		srv.request.second_shelf = false;
	} else if (mission_id_ == 4) {
		srv.request.left_to_right = false;
		srv.request.second_shelf = true;
	} else if (mission_id_ == 2) {
		ROS_INFO("Mission 2 is special, detect nothing!");
		return;
	} else if (mission_id_ == 3) {
		ROS_INFO("Mission 3 is special, detect nothing!");
		current_state_ = 1;
		mission_id_ = 4;
		return;
	}
	else if (mission_id_ == 10) {
		ROS_INFO("Recv CB,carry out mission 3");
		mission_id_ = 3;
	}

	// 我没想好怎么处理重试的逻辑，所以这里直接用goto了
	static int retry_count = 0;
	while (true) {
		bool flag = detect_client_.call(srv);
		auto detect_info = srv.response.detect_info;

		if (flag) {
			auto box_size = 6;
			if (qualifier_) {
				box_size = 4;
			}
			if (detect_info.box_infos.size() != box_size) {
				ROS_ERROR("Invalid box info size, attempt to call detect service again");
				retry_count++;
				if (retry_count <= 3) {
					continue;
				} else {
					// 填充到box_size，防止后面的代码出错
					for (int i = detect_info.box_infos.size(); i < box_size; i++) {
						yolo_detector::BoxInfo box_info;
						box_info.good_count = 0;
						box_info.bad_count = 0;
						detect_info.box_infos.push_back(box_info);
					}
					ROS_INFO("Retry count reached, fill box info with 0");
					break;
				}
			}
			if (srv.response.success) {
				ROS_INFO("Detect service called with true");
				if (!qualifier_) {
					switch (mission_id_) {
					case 0:
						shelf_info_[{1, 1}] = detect_info.box_infos.at(0);
						shelf_info_[{1, 5}] = detect_info.box_infos.at(1);
						shelf_info_[{1, 9}] = detect_info.box_infos.at(2);
						shelf_info_[{1, 2}] = detect_info.box_infos.at(3);
						shelf_info_[{1, 6}] = detect_info.box_infos.at(4);
						shelf_info_[{1, 10}] = detect_info.box_infos.at(5);
						break;
					case 1:
						shelf_info_[{1, 3}] = detect_info.box_infos.at(0);
						shelf_info_[{1, 7}] = detect_info.box_infos.at(1);
						shelf_info_[{1, 11}] = detect_info.box_infos.at(2);
						shelf_info_[{1, 4}] = detect_info.box_infos.at(3);
						shelf_info_[{1, 8}] = detect_info.box_infos.at(4);
						shelf_info_[{1, 12}] = detect_info.box_infos.at(5);
						break;
					case 4:
						shelf_info_[{2, 3}] = detect_info.box_infos.at(0);
						shelf_info_[{2, 7}] = detect_info.box_infos.at(1);
						shelf_info_[{2, 11}] = detect_info.box_infos.at(2);
						shelf_info_[{2, 4}] = detect_info.box_infos.at(3);
						shelf_info_[{2, 8}] = detect_info.box_infos.at(4);
						shelf_info_[{2, 12}] = detect_info.box_infos.at(5);
						break;
					case 5:
						shelf_info_[{2, 1}] = detect_info.box_infos.at(0);
						shelf_info_[{2, 5}] = detect_info.box_infos.at(1);
						shelf_info_[{2, 9}] = detect_info.box_infos.at(2);
						shelf_info_[{2, 2}] = detect_info.box_infos.at(3);
						shelf_info_[{2, 6}] = detect_info.box_infos.at(4);
						shelf_info_[{2, 10}] = detect_info.box_infos.at(5);
						break;

					case 2:
					case 3:
						// No operation needed
						break;
					default:
						ROS_ERROR("Unknown mission id");
						break;
					}
				} else {
					switch (mission_id_) {
					case 0:
						shelf_info_[{1, 1}] = detect_info.box_infos.at(0);
						shelf_info_[{1, 9}] = detect_info.box_infos.at(1);
						shelf_info_[{1, 2}] = detect_info.box_infos.at(2);
						shelf_info_[{1, 10}] = detect_info.box_infos.at(3);
						break;
					case 1:
						shelf_info_[{1, 3}] = detect_info.box_infos.at(0);
						shelf_info_[{1, 11}] = detect_info.box_infos.at(1);
						shelf_info_[{1, 4}] = detect_info.box_infos.at(2);
						shelf_info_[{1, 12}] = detect_info.box_infos.at(3);
						break;
					case 4:
						shelf_info_[{2, 3}] = detect_info.box_infos.at(0);
						shelf_info_[{2, 11}] = detect_info.box_infos.at(1);
						shelf_info_[{2, 4}] = detect_info.box_infos.at(2);
						shelf_info_[{2, 12}] = detect_info.box_infos.at(3);
						break;
					case 5:
						shelf_info_[{2, 1}] = detect_info.box_infos.at(0);
						shelf_info_[{2, 9}] = detect_info.box_infos.at(1);
						shelf_info_[{2, 2}] = detect_info.box_infos.at(2);
						shelf_info_[{2, 10}] = detect_info.box_infos.at(3);
						break;

					case 2:
					case 3:
						// No operation needed
						break;
					default:
						ROS_ERROR("Unknown mission id");
						break;
					}
				}
				break;
			} else {
				ROS_ERROR("Detect service returned false");
				retry_count++;
				if (retry_count <= 3) {
					continue;
				} else {
					break;
				}
			}
		} else {
			ROS_ERROR("Failed to call detect service");
			retry_count++;
			if (retry_count <= 3) {
				continue;
			} else {
				break;
			}
		}
	}
	current_state_ = 1;
	mission_id_++;
	retry_count = 0;
}

void RobotDecision::saveResult() {
	ROS_INFO("Saving result for mission %d", mission_id_);
	std::ofstream file;
	file.open("/media/tta/E50E-BC97/tta/list_of_goods.csv");
	// 检查文件是否成功打开
	if (!file) {
		std::cerr << "Unable to open or create file";
		return;// 退出程序，返回非零值表示错误
	}
	file << "房间,好人,坏人\n";
	for (const auto &[shelf, box_info] : shelf_info_) {
		file << shelf.first << "-" << shelf.second << "," << box_info.good_count << "," << box_info.bad_count << "\n";
	}
	file.close();
	current_state_ = 4;
}

bool RobotDecision::startCallback(robot_decision::StartDecision::Request &req, robot_decision::StartDecision::Response &res) {
	if (req.start == true) {
		ROS_INFO("Start decision service called with true");
		ros::Duration(5).sleep();
		start_trigger_ = true;
		current_state_ = 1;
		mission_id_ = 0;
	} else {
		ROS_INFO("Start decision service called with false");
		start_trigger_ = false;
		current_state_ = 0;
	}
	res.response = true;
	return true;
}

void RobotDecision::arrivalCallback(const std_msgs::Bool::ConstPtr &msg) {
	arrival_ = msg->data;
}
bool RobotDecision::chargeCallback(std_srvs::SetBool::Request &req, std_srvs::SetBool::Response &res) {
	if (req.data) {
		ROS_INFO("Charge decision service called with true");
		mission_completed_ = true;
		moving_ = false;
		current_state_ = 1;
		mission_id_ = 10;
		timer_.stop();// 停止计时器
		res.success = true;
	} else {
		ROS_INFO("Charge decision service called with false");
		res.success = false;
	}
	return true;
}

void RobotDecision::timerCallback(const ros::TimerEvent &event) {
	if (!mission_completed_) {
		ROS_INFO("Timeout of 90 seconds reached.");
		current_state_ = 1;
		mission_id_ = 10;
		moving_ = false;
	}
}