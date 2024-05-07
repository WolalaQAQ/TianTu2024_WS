#!/bin/bash

# 定义当前工作空间路径
WORKSPACE=$(pwd)

echo "编译工作空间中的所有包,除了cartographer和cartographer_ros..."
# 使用 skiplist 跳过特定包
catkin config --workspace $WORKSPACE --skiplist cartographer cartographer_ros cartographer_rviz cartographer_ros_msgs
# 构建工作空间
catkin build --workspace $WORKSPACE

catkin_make_isolated --install --use-ninja --only-pkg-with-deps cartographer cartographer_ros cartographer_rviz cartographer_ros_msgs

# 使用 skiplist 跳过特定包
catkin config --workspace $WORKSPACE --skiplist cartographer cartographer_ros cartographer_rviz cartographer_ros_msgs
# 构建工作空间
catkin build --workspace $WORKSPACE

# 使用 skiplist 跳过特定包
catkin config --workspace $WORKSPACE --skiplist cartographer cartographer_ros cartographer_rviz cartographer_ros_msgs
# 构建工作空间
catkin build --workspace $WORKSPACE

# 检查是否编译成功
if [ $? -ne 0 ]; then
  echo "编译失败"
  exit 1
fi

echo "编译完成。"

source $WORKSPACE/devel/setup.bash
source $WORKSPACE/devel_isolated/setup.bash
