#!/bin/bash

source ./devel/setup.sh

udisksctl mount -b /dev/mmcblk1p1

# 启动 myep_base.launch 文件
roslaunch myep_bsae myep_base.launch & sleep 5;

roslaunch yolo_detector yolo_detector.launch & sleep 2;
# 启动 amcl_tiantu.launch 文件
roslaunch robot_decision amcl_tiantu.launch & sleep 2;

roslaunch robot_decision robot_decision.launch;

wait
