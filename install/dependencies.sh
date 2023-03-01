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
apt-get install -y python-wstool python-catkin-tools ros-melodic-cmake-modules protobuf-compiler autoconf
apt install -y ros-melodic-mesh-tools
apt install -y ros-melodic-ompl
apt-get install -y build-essential cmake-gui libsuitesparse-dev