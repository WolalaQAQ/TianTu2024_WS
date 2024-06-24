#include <cmath>

class YawController {
public:
    YawController(float Kp,float Ki,float target_yaw,float current_yaw) {
        this->Kp = Kp;
        this->Ki = Ki;
        this->target_yaw = target_yaw;
    }

    void yaw_control(float current_yaw, float &yaw_speed,float dt) {
        float error = target_yaw - current_yaw;

        if (error > M_PI) {
            error -= 2 * M_PI;
        } else if (error < -M_PI) {
            error += 2 * M_PI;
        }
        if (std::fabs(error) < dead_zone) {
            yaw_speed = 0.0f;
            return;
        } //在死区内不进行控制

        integral += error * dt;
        if(integral >= 1)
        {
            integral = 1 ;
        }
        else if(integral <= -1)
        {
            integral = -1 ;
        }
        //抗饱和，设置积分限

        yaw_speed = Kp * error + Ki*integral;

    }

    private:
        float dead_zone = (2 / 180.0) * M_PI ; //控制死区，这个区间内不进行控制
        float Kp; //比例系数
        float Ki; //积分系数
        float target_yaw; //目标角度
        float integral; //误差积分项

};

