#!/bin/sh
apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE
add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u
rm -f /etc/apt/sources.list.d/realsense-public.list
apt-get update  # To get the latest package lists
apt-get install ros-kinetic-map-server python-wstool python-rosdep ninja-build ros-kinetic-abseil-cpp ros-kinetic-geometry2 libarmadillo-dev ros-kinetic-moveit-msgs librealsense2-dkms librealsense2-utils librealsense2-dev ros-kinetic-rviz librealsense2-dbg ros-kinetic-cv-bridge ros-kinetic-rgbd-launch libgazebo7-dev ros-kinetic-gazebo-ros-pkgs ros-kinetic-gazebo-ros-control ros-kinetic-ros-controllers ros-kinetic-sbg-driver -y
#etc.
