
#include "./pid_tracker.h"
#include <iostream>

Eigen::Vector2d PIDTracker::speedOutput(const Eigen::Vector2d &start_trace,
                                        const Eigen::Vector2d &end_trace,
                                        const nav_msgs::Path &path,
                                        const double &delta_time) {
    /*###参数初始化###*/

    Eigen::Vector2d errorDistance = Eigen::Vector2d::Zero();
    Eigen::Vector2d speedOutput = Eigen::Vector2d::Zero();

    if (start_trace.x() == -1.0 || start_trace.y() == -1.0 || end_trace.x() == -1.0 || end_trace.y() == -1.0) {
        return Eigen::Vector2d::Zero();
    }
    /*###已导航状态###*/
    const double currentDistance = sqrt(pow(start_trace.x() - end_trace.x(), 2) + pow(start_trace.y() - end_trace.y(), 2) );
    // std::cout << "currentDistance" << currentDistance << std::endl;
    if (currentDistance <= arrival_threshold_) {
        errorDistance.x() = 0.0f;
        errorDistance.y() = 0.0f;
        this->nav_status_flag_ = 1;//到达导航点
        reset();
    } else if (!path.poses.empty()) {
        for (const auto& it: path.poses) {
            double dis = sqrt(
                    pow(it.pose.position.x - path.poses.front().pose.position.x, 2) + pow(it.pose.position.y - path.poses.front().pose.position.y, 2) );
            if (dis >= forward_distance_) {
                //误差计算
                errorDistance.x() = it.pose.position.x - path.poses.front().pose.position.x;
                errorDistance.y() = it.pose.position.y - path.poses.front().pose.position.y;

                this->nav_status_flag_ = 0;//未能到达导航点
                break;
            }
        }
    } else {
        this->nav_status_flag_ = 0;//未能到达导航点
    }

    error_integral_ += delta_time * errorDistance;
    const Eigen::Vector2d error_derivative = (errorDistance - error_previous_) / delta_time;

    /*###速度输出计算###*/
    speedOutput = kp_ * errorDistance + ki_ * error_integral_ + kd_ * error_derivative;
    // std::cout << "speed Output x轴速度" << speedOutput.x() << " y轴速度" << speedOutput.y() << std::endl;
    // std::cout << "errorDistance x轴" << errorDistance.x() << " y轴" << errorDistance.y() << std::endl;
    /*###速度输出限幅###*/
    speedOutput = speedOutput.cwiseMin(speed_limit_).cwiseMax(-speed_limit_);

    error_previous_ = errorDistance;

    return speedOutput;
}

void PIDTracker::reset() {
    error_integral_ = Eigen::Vector2d::Zero();
    error_previous_ = Eigen::Vector2d::Zero();
}