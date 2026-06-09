# TianTu2024_WS

2024全国大学生智能汽车竞赛 天途创意组 代码仓库

## 无人机代码

[无人机代码](https://github.com/WolalaQAQ/TianTu2024_Drone_WS)

### yolo_detector依赖安装方法
[见yolo_detector下的README](./src/yolo_detector/README.md)

# 启动方法
## 启动下位机djiep
````bash
roslaunch myep_bsae myep_base.launch  
````
## 启动定位导航模块
````bash
roslaunch robot_decision amcl_tiantu.launch
````

## 启动建图模块
````bash
roslaunch robot_decision mapping_tiantu.launch  
roslaunch robot_decision map_saver_tiantu.launch  # 建图结束后保存地图
````
