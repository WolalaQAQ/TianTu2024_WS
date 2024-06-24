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
 2.07573 -0.802356

 ➜  TianTu2024_WS git:(master) ✗ rostopic echo /move_base_simple/goal
header: 
  seq: 1
  stamp: 
    secs: 1719234586
    nsecs: 982694771
  frame_id: "map"
pose: 
  position: 
    x: 4.759303092956543
    y: -0.7254384756088257
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 0.06961035085633668
    w: 0.9975742574132803

    header: 
  seq: 6
  stamp: 
    secs: 1719234700
    nsecs:  29794963
  frame_id: "map"
pose: 
  position: 
    x: 6.731288909912109
    y: 1.0915144681930542
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 0.7237183896773542
    w: 0.6900954227082058

  ---
header: 
  seq: 7
  stamp: 
    secs: 1719234728
    nsecs:   1334177
  frame_id: "map"
pose: 
  position: 
    x: 4.628156661987305
    y: 1.5950546264648438
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: -0.002547952616382761
    w: 0.999996753963464
---


---
header: 
  seq: 8
  stamp: 
    secs: 1719234765
    nsecs: 405151465
  frame_id: "map"
pose: 
  position: 
    x: 1.9674516916275024
    y: 1.5453630685806274
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 0.011884984141320235
    w: 0.9999293710817583
---

---
header: 
  seq: 12
  stamp: 
    secs: 1719234845
    nsecs: 403999269
  frame_id: "map"
pose: 
  position: 
    x: 0.7704163789749146
    y: -0.24457277357578278
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: -0.007085665441170547
    w: 0.9999748963575315
---