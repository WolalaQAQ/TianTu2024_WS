#ifndef BUILD_SRC_ROBOT_DECISION_INCLUDE_ROBOT_DECISION_ROBOT_DECISION_H

#include <ros/ros.h>
#include <thread>
#include <memory>
#include <std_msgs/Bool.h>
#include <Eigen/Eigen>
#include <fstream>

#include "robot_decision/StartDecision.h"
#include "yolo_detector/StartDetect.h"
#include "yolo_detector/DetectInfo.h"

using ShelfLocation = std::pair<int, int>;

class RobotDecision {
public:
	RobotDecision() = delete;
	explicit RobotDecision(ros::NodeHandle& nh);

	~RobotDecision();
private:
  	ros::NodeHandle nh_;
	ros::ServiceServer start_service_;
	ros::ServiceClient detect_client_;
	// 创建一个在同一wifi下接收无人机发送完成起降的服务
	ros::ServiceServer charge_service_;

	ros::Publisher target_pub_;
	ros::Subscriber arrival_sub_;

	std::shared_ptr<std::thread> work_thread_;
    bool mission_completed_ = false;

	bool start_trigger_ = false;
	int current_state_ = 0;
	int mission_id_ = -1;

	bool moving_ = false;
	bool arrival_ = true;

	std::vector<double> target_points_flat_;
	std::vector<Eigen::Vector3d> target_points_;

	std::map<ShelfLocation, yolo_detector::BoxInfo> shelf_info_;

	void work();

	void moveToTarget();
	void startDetect();
	void saveResult();

	bool startCallback(robot_decision::StartDecision::Request& req, robot_decision::StartDecision::Response& res);
	void arrivalCallback(const std_msgs::Bool::ConstPtr& msg);
	bool chargeCallback(std_srvs::SetBool::Request &req, std_srvs::SetBool::Response &res);
    void timerCallback(const ros::TimerEvent &event);

};

#define BUILD_SRC_ROBOT_DECISION_INCLUDE_ROBOT_DECISION_ROBOT_DECISION_H
#endif//BUILD_SRC_ROBOT_DECISION_INCLUDE_ROBOT_DECISION_ROBOT_DECISION_H