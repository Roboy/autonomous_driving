FROM ros:kinetic-robot

WORKDIR /home/ros

# Install system libraries
RUN apt-get update && \
    apt-get install -y sudo ninja-build python-catkin-tools ros-kinetic-catkin

# Initialize ROS
RUN /bin/bash -c 'source /opt/ros/kinetic/setup.bash'

# Copy autonomous driving code
RUN git clone https://github.com/Roboy/autonomous_driving_src.git src
WORKDIR /home/catkin_ws/src

# Install prebuild packages
RUN sudo apt-get install ros-kinetic-map-server && \
    sudo apt-get install ros-kinetic-sick-scan && \
    sudo apt-get install -y python-wstool python-rosdep ninja-build && \
    sudo apt-get install ros-kinetic-abseil-cpp && \
    sudo apt-get install ros-kinetic-geometry2 && \
    sudo apt-get install libarmadillo-dev && \
    sudo apt-get install ros-kinetic-moveit-msgs

RUN git checkout devel && \
    git submodule init && \
    git submodule update

RUN cd /home/ros/src/cartographer_ros && \
    git checkout roboy

# Compile cartographer
WORKDIR /home/ros
RUN wstool init src && \
    wstool merge -t src https://raw.githubusercontent.com/Roboy/cartographer_ros/roboy/cartographer_ros.rosinstall && \
    wstool update -t src

RUN src/cartographer/scripts/install_proto3.sh && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y 

# Build catkin workspace
RUN catkin config --extend /opt/ros/kinetic
RUN catkin build
RUN /bin/bash -c 'source devel/setup.bash'

# Configure ROS master
RUN export ROS_MASTER_URI=0.0.0.0:11311

CMD roscore 
