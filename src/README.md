# Further AD Modules

This folder contains additional ROS-packages for Roboy. The idea is that you can clone and build the [autonomous_driving_src](https://github.com/Roboy/autonomous_driving_src/) repository easily and are able to record data and run simulations on any machine. Packages contained here can also be cloned to your catkin workspace but might require significantly more effort to build.

## List of modules
### cartographer_ros
### obstacle_detector
This [package](https://github.com/tysik/obstacle_detector) provides obstacle detection based on raw lidar data. This could be a possible extension for a more complex obstacle avoidance.

At the current stage the local planner of the ROS navigation stack can subscribe to laserscan data to adapt the local plan to drive around obstacles.
