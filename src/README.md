# Further AD Modules

This folder contains additional ROS-packages for Roboy. The idea is that you can clone and build the [autonomous_driving_src](https://github.com/Roboy/autonomous_driving_src/) repository easily and are able to record data and run simulations on any machine. Packages contained here can also be cloned to your catkin workspace but might require significantly more effort to build.

# List of Modules

## Obstacle_Detector
[Obstacle Detector](https://github.com/tysik/obstacle_detector) is a ROS package for 2D obstacle detection based on laser range data.

## Intel Realsense Camera
[Intel(R) RealSense(TM) ROS Wrapper](https://github.com/intel-ros/realsense) for D400 series and SR300 Camera http://wiki.ros.org/RealSense

Follow *Usage Instructions* in provided link for first steps.

## Calibration
The submodule [radlocc_calibration](https://github.com/bernardomig/radlocc_calibration) contains a tool that can be used to record camera and lidar data for extrinsic-calibration between camera an lidar. For more info about how to do the calibration visit the [wiki article](https://github.com/Roboy/autonomous_driving/wiki/Calibration:-Extrinsic-calibration-between-camera-and-lidar) of the [Roboy autonomous_driving repository](https://github.com/Roboy/autonomous_driving).


### cartographer_ros
### obstacle_detector
This [package](https://github.com/tysik/obstacle_detector) provides obstacle detection based on raw lidar data. This could be a possible extension for a more complex obstacle avoidance.

At the current stage the local planner of the ROS navigation stack can subscribe to laserscan data to adapt the local plan to drive around obstacles.
