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
        integral += error * dt;
        yaw_speed = Kp * error+Ki*integral;

    }

    private:
        float Kp;
        float Ki;
        float target_yaw;
        float integral;

};

