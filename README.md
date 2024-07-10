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

header: 
  seq: 0
  stamp: 
    secs: 1719841441
    nsecs: 441099649
  frame_id: "map"
pose: 
  position: 
    x: 2.0238935947418213
    y: -1.0188543796539307
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 7.529745191438187e-05
    w: 0.9999999971651469

header: 
  seq: 0
  stamp: 
    secs: 1719842450
    nsecs: 914747614
  frame_id: "map"
pose: 
  position: 
    x: 5.202322959899902
    y: -1.0604170560836792
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 0.01797217224256599
    w: 0.9998384874692929
---
header: 
  seq: 2
  stamp: 
    secs: 1719842507
    nsecs: 765902887
  frame_id: "map"
pose: 
  position: 
    x: 6.580988883972168
    y: 2.2393453121185303
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 0.9992119548969758
    w: 0.0396921804763107
---
---
header: 
  seq: 4
  stamp: 
    secs: 1719842554
    nsecs: 618092299
  frame_id: "map"
pose: 
  position: 
    x: 5.251081466674805
    y: 1.3968594074249268
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 0.0905946822060595
    w: 0.9958878468763354
---
header: 
  seq: 6
  stamp: 
    secs: 1719842584
    nsecs: 650757273
  frame_id: "map"
pose: 
  position: 
    x: 1.8356785774230957
    y: 1.6096141338348389
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 0.00180444454175531
    w: 0.9999983719886226
---

---
header: 
  seq: 7
  stamp: 
    secs: 1719842607
    nsecs: 463056230
  frame_id: "map"
pose: 
  position: 
    x: -0.1554727554321289
    y: -0.21910059452056885
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: -0.022898669145267524
    w: 0.9997377910989339
---