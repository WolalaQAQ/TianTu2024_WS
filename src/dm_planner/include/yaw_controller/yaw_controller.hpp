#include <cmath>

class YawController {
public:
    YawController(float Kp,float target_yaw,float current_yaw) {
        this->Kp = Kp;
        this->target_yaw = target_yaw;
    }

    void yaw_control(float current_yaw, float &yaw_speed) {
        float error = target_yaw - current_yaw;
        if (error > M_PI) {
            error -= 2 * M_PI;
        } else if (error < -M_PI) {
            error += 2 * M_PI;
        }
        yaw_speed = Kp * error;
    }

    private:
        float Kp;
        float target_yaw;

};

