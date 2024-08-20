#FROM ros:melodic
FROM ros:noetic

# timedatectl list-timezones
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -q -y --no-install-recommends apt-utils
RUN apt-get install -q -y --no-install-recommends net-tools iproute2 iputils-ping
RUN apt-get install -q -y --no-install-recommends git tmux vim neovim
# needed for system dependencies
RUN apt-get install -q -y --no-install-recommends \
      cmake build-essential unzip pkg-config autoconf \
      libboost-all-dev \
      libjpeg-dev libpng-dev libtiff-dev \
      libvtk6-dev libgtk-3-dev \
      libatlas-base-dev gfortran \
      libparmetis-dev \
      python3-wstool python3-catkin-tools python3-pip
# needed for misc ros pacakges; can be simplified for lighter container
RUN apt-get install -q -y --no-install-recommends ros-noetic-desktop-full
# needed for mesh_rviz_plugins
RUN apt-get install -q -y --no-install-recommends \
      ros-noetic-image-geometry ros-noetic-pcl-ros ros-noetic-cv-bridge
# needed for gtsam
RUN apt-get install -q -y --no-install-recommends libtbb-dev
# needed catkin build
RUN apt-get install -q -y --no-install-recommends libtool
# needed 
RUN apt install opencl-headers ocl-icd-opencl-dev -y
# needed for tmux launch scripts
RUN apt-get install tmuxp python3-vcstool -y
# needed for downloading vocab file
RUN apt-get install wget unzip -y
# clean up
RUN apt-get autoremove -y
RUN apt-get clean
#RUN rm -rf /var/lib/apt/lists/*

ENV ROS_DIR=/opt/ros/${ROS_DISTRO}
ENV HOME=/root/
ENV WORKSPACE=/root/catkin_ws
RUN mkdir -p $WORKSPACE/src

WORKDIR $WORKSPACE/src

# Install kimera-multi dependencies
RUN git clone https://github.com/MIT-SPARK/Kimera-Multi.git
RUN bash Kimera-Multi/install/dependencies.sh

# Clone source code
COPY "./copy/kimera_multi_https.repos" .
RUN vcs import . --input kimera_multi_https.repos --recursive

# Apply patches
COPY "./copy/kimera_multi_lcd.patch" /root
COPY "./copy/kimera_semantics.patch" /root
WORKDIR $WORKSPACE/src/kimera_multi_lcd
RUN git apply /root/kimera_multi_lcd.patch
WORKDIR $WORKSPACE/src/kimera_semantics
RUN git apply /root/kimera_semantics.patch

# catkin build
SHELL ["/bin/bash", "-c"]
WORKDIR ${WORKSPACE}
RUN catkin init
RUN catkin config -a --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DGTSAM_TANGENT_PREINTEGRATION=OFF -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF -DOPENGV_BUILD_WITH_MARCH_NATIVE=OFF
RUN catkin config --merge-devel
RUN source $ROS_DIR/setup.bash && catkin build -c -s -j6

# Download vocabulary file
WORKDIR ${WORKSPACE}/src/kimera_multi_lcd
RUN pip install gdown
RUN gdown 'https://drive.google.com/uc?export=download&confirm=9iBg&id=1N4y0HbgA3PHQ73ZxFJvy5dgvV_0cTBYF'
RUN unzip vocab.zip

WORKDIR /root

COPY "./copy/entrypoint.bash" /
ENTRYPOINT ["/entrypoint.bash"]
