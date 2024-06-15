

#ifndef PID_TRACKER_H
#define PID_TRACKER_H

#include <Eigen/Eigen>
#include <nav_msgs/Path.h>

class PIDTracker {
public:
    PIDTracker(double kp, double ki, double kd, double speed_limit, double arrival_threshold, double forward_distance) :
    kp_(kp),
    ki_(ki),
    kd_(kd),
    speed_limit_(speed_limit),
    arrival_threshold_(arrival_threshold),
    forward_distance_(forward_distance) {}

    Eigen::Vector2d speedOutput(const Eigen::Vector2d &start_trace, const Eigen::Vector2d &end_trace, const nav_msgs::Path &path, const double &delta_time);

    void reset();

private:
    double kp_;
    double ki_;
    double kd_;
    double speed_limit_;
    double arrival_threshold_;
    double forward_distance_;

    Eigen::Vector2d error_integral_ = Eigen::Vector2d::Zero();
    Eigen::Vector2d error_previous_ = Eigen::Vector2d::Zero();

    int nav_status_flag_ = 0;

};

#endif //PID_TRACKER_H