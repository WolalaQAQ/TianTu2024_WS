# TianTu2024_WS

## 这部分是我痛失的cartographer

````bash
# 先停止建图：
rosservice call /finish_trajectory 0
# 然后保存成pbstream，自己更改保存路径，注意不能写相对路径，测试过不行
rosservice call /write_state "{filename: '${HOME}/Downloads/mymap.pbstream'}"
#导出成一般导航使用的yaml+pgm
rosrun cartographer_ros cartographer_pbstream_to_ros_map -map_filestem=${HOME}/Downloads/mymap -pbstream_filename=${HOME}/Downloads/mymap.pbstream -resolution=0.05
# 保存可能有更方便的操作，我这边参考的是：https://www.ncnynl.com/archives/201904/2915.html
````

````bash
git clone https://github.com/RoboMaster/RoboRTS.git

````
## 环境依赖（不全）

````bash
sudo apt-get install libopus-dev
sudo apt-get install pkg-config
sudo apt-get install ros-noetic-vision-msgs
sudo apt-get install ros-noetic-laser-proc
sudo apt-get install ros-noetic-urg-c
````

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
## 待补充

first point
➜  TianTu2024_WS git:(master) rostopic echo /move_base_simple/goal
WARNING: topic [/move_base_simple/goal] does not appear to be published yet
header: 
  seq: 0
  stamp: 
    secs: 1718532288
    nsecs: 200352658
  frame_id: "map"
pose: 
  position: 
    x: 1.3347554206848145
    y: -0.7557542324066162
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: -0.02130095664941463
    w: 0.9997731088831204
---
sceond point
➜  TianTu2024_WS git:(master) ✗ rostopic echo /move_base_simple/goal
header: 
  seq: 11
  stamp: 
    secs: 1718532615
    nsecs: 412139899
  frame_id: "map"
pose: 
  position: 
    x: 3.8800299167633057
    y: -1.1198943853378296
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 0.004989732306131559
    w: 0.9999875512082703
---
third point 
---
header: 
  seq: 3
  stamp: 
    secs: 1718533201
    nsecs: 514146363
  frame_id: "map"
pose: 
  position: 
    x: 3.790919065475464
    y: 1.2395868301391602
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: -0.04394680051250963
    w: 0.9990338726613396
---

fouth point
---
header: 
  seq: 5
  stamp: 
    secs: 1718533248
    nsecs: 449033560
  frame_id: "map"
pose: 
  position: 
    x: 1.401595115661621
    y: 1.4355823993682861
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: -0.06124810589765359
    w: 0.9981225723947684
---

landing point
---
header: 
  seq: 10
  stamp: 
    secs: 1718533349
    nsecs: 524542754
  frame_id: "map"
pose: 
  position: 
    x: 5.98182487487793
    y: 0.8294860124588013
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: -0.05120179977776014
    w: 0.9986883276075265
---


