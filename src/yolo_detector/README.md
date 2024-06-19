# 依赖安装
由于该代码要求OpenCV版本>=4.7.0，而ros-noetic自带的版本为4.2.0，同时自带的cv_bridge也是基于4.2.0的，因此需要自行编译安装OpenCV，并将cv_bridge重新编译。

理论上大于等于4.7.0版本都可以，但是我只测试了4.10.0版本，推荐直接使用4.10.0版本。下面的流程均为基于4.10.0版本。

## 安装OpenCV
进入[OpenCV Github仓库 4.10.0 Tag](https://github.com/opencv/opencv/tree/4.10.0)和[OpenCV-Contrib Github仓库 4.10.0 Tag](https://github.com/opencv/opencv/tree/4.10.0)，下载源码zip并解压。进入源码目录

```bash
sudo apt install cmake-qt-gui
mkdir build && cd build
cmake-gui ..
```

在cmake-gui中，点击configure，选择生成器，选择编译器，点击finish。然后在弹出的界面中，找到`OPENCV_EXTRA_MODULES_PATH`，将其设置为OpenCV-Contrib的modules目录，然后点击configure，再点击generate。完成后可以退出cmake-gui。然后执行

```bash
make -j8
sudo make install
```

此时OpenCV已经安装完成。还需要配置OpenCV的环境变量，将下面的内容添加到`~/.bashrc`中

```bash
export PATH="$PATH:/usr/local/bin"
```

然后执行

```bash
source ~/.bashrc
opencv_version
```

如果显示的版本号为4.10.0，则OpenCV安装成功。

## 重新编译cv_bridge
进入[vision_opencv Github仓库 noetic分支](https://github.com/ros-perception/vision_opencv/tree/noetic)，下载源码zip并解压。进入源码目录

```bash
mkdir build && cd build
cmake-gui ..
```

自己编译的cv_bridge最好放在用户主目录，不要放在系统目录。在cmake-gui中，点击configure，选择生成器，选择编译器，点击finish。然后在弹出的界面中，找到`CMAKE_INSTALL_PREFIX`，将其设置为用户主目录下的`cv_bridge_4.10`目录，然后点击configure，再点击generate。完成后可以退出cmake-gui。然后执行

```bash
make -j8
make install
```

此时cv_bridge已经安装完成。此时打开该包下的[CMakeLists.txt](./CMakeLists.txt)文件，将`set(cv_bridge_DIR /home/wolala/cv_bridge_4.10/share/cv_bridge/cmake)`改为你自己的cv_bridge目录。

此时你应该可以正常编译该包了。
