#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist

def move_forward():
    # 初始化ROS节点
    rospy.init_node('move_forward', anonymous=True)

    # 创建一个发布者，用于发布速度指令
    pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)

    # 设置循环频率
    rate = rospy.Rate(10)

    # 目标距离为1米
    distance_to_travel = 1.0   # 目标移动距离

    # 计算移动所需的时间
    speed = 0.2   # 速度为0.2m/s
    time_to_travel = abs(distance_to_travel / speed)

    # 创建Twist消息对象
    velocity_msg = Twist()
    velocity_msg.linear.x = speed   # 设置线速度为速度值

    # 发布速度指令并控制机器人前进
    start_time = rospy.Time.now().to_sec()   # 记录开始时间

    while not rospy.is_shutdown():
        # 发布速度指令
        pub.publish(velocity_msg)

        # 当前时间与开始时间之差大于等于所需时间则停止机器人
        if rospy.Time.now().to_sec() - start_time >= time_to_travel:
            break

        rate.sleep()

    # 停止机器人
    velocity_msg.linear.x = 0.0   # 设置线速度为0来停止机器人
    pub.publish(velocity_msg)

if __name__ == '__main__':
    try:
        move_forward()
    except rospy.ROSInterruptException:
        pass
