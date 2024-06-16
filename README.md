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
    secs: 1718361352
    nsecs:  66535698
  frame_id: "map"
pose: 
  position: 
    x: 3.461719512939453
    y: -0.7156164050102234
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: -0.01960187583884722
    w: 0.9998078647738267


    header: 
  seq: 1
  stamp: 
    secs: 1718361400
    nsecs: 598585486
  frame_id: "map"
pose: 
  position: 
    x: 6.6016950607299805
    y: -0.5210127234458923
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 0.721574809752507
    w: 0.6923364745054483

    ---
header: 
  seq: 6
  stamp: 
    secs: 1718361551
    nsecs: 306760885
  frame_id: "map"
pose: 
  position: 
    x: 3.083817720413208
    y: 1.6916954517364502
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: -0.9995634929750112
    w: 0.02954358

    ---
header: 
  seq: 12
  stamp: 
    secs: 1718361658
    nsecs:  17064842
  frame_id: "map"
pose: 
  position: 
    x: 0.22161200642585754
    y: -0.21711376309394836
    z: 0.0
  orientation: 
    x: 0.0
    y: 0.0
    z: 0.0037476735471838165
    w: 0.9999929774468338
---