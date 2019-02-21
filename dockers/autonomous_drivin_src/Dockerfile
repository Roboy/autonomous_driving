FROM ros:kinetic-robot

WORKDIR /home/ros

# Install system libraries
RUN apt-get update && \
    apt-get install -y sudo ninja-build python-catkin-tools python-wstool python-rosdep ros-kinetic-catkin ros-kinetic-map-server ros-kinetic-sick-scan ros-kinetic-abseil-cpp ros-kinetic-geometry2 libarmadillo-dev ros-kinetic-moveit-msgs

# Initialize ROS
RUN /bin/bash -c 'source /opt/ros/kinetic/setup.bash'

# Copy autonomous driving code
RUN git clone https://github.com/Roboy/autonomous_driving_src.git src
WORKDIR /home/ros/src

RUN git checkout docker && \
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
