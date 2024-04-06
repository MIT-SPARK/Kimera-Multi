#!/bin/sh
apt-get update
apt-get install -y --no-install-recommends apt-utils
apt-get install -y cmake
apt-get install -y libboost-all-dev
apt-get install -y \
      build-essential unzip pkg-config \
      libjpeg-dev libpng-dev libtiff-dev \
      libvtk6-dev \
      libgtk-3-dev \
      libparmetis-dev \
      libatlas-base-dev \
      gfortran
apt-get install -y libtbb-dev
apt-get install -y libgflags-dev libgoogle-glog-dev
apt-get install -y python-wstool python-catkin-tools ros-${ROS_DISTRO}-cmake-modules protobuf-compiler autoconf
# apt install -y ros-melodic-mesh-tools
apt-get install -y libgtk2.0-dev opencl-clhpp-headers
apt install -y ros-${ROS_DISTRO}-pcl-ros ros-${ROS_DISTRO}-tf-conversions ros-${ROS_DISTRO}-camera-info-manager ros-${ROS_DISTRO}-interactive-markers ros-${ROS_DISTRO}-rviz 
apt install -y ros-${ROS_DISTRO}-ompl
apt-get install -y build-essential cmake-gui libsuitesparse-dev

pip install vcstool empy==3.3.4 catkin_pkg numpy