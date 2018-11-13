# Autonomous Driving

## Repository Structure
The folder '/src' is intended to simply be cloned into the needed catkin workspace. Within src, the packages stated in section X are included. For setup from scratch, follow the according guide. 

## Prerequisites
### ROS Kinetic
[ROS Kinetic](http://wiki.ros.org/kinetic)

### Rosbridge_suite
Make sure you get [ROSbridge suite](http://wiki.ros.org/rosbridge_suite)'s kinetic version!

### Catkin Tools
[Catkin tools](https://catkin-tools.readthedocs.io/en/latest/installing.html) for the use of catkin build.

### Common Commands
```
rostopic list
rostopic echo /fake/scan
```

## Install
Clone submodule `autonomous_driving_src` into your `catkin_ws/src` folder. 

### RVIZ
RVIZ (´$ rviz´) is the tool used for visualization
Setup: Choose what you get, either a pointcloud (3d) or a laser scan (2D) and set fixed frame variable accordingly. 

# Hardware Setup

## LIDAR 
After the stated packages have been build, connect the LIDAR to an appropriate power source (brown = positive -> red, blue = negative -> black) and an ethernet switch. You will need to connect your Laptop to that switch as well. 

Hint for VM users: This guide was written based on experiences from a USB-C only MacBook running Ubuntu 16.04 in VMware Fusion. When connecting ethernet through a ethernet to USB-C adapter, mount the adapter to macOS, such that the connection is shown in the System Preferences of your host machine. Then, disconnect from any WiFi connections and the VM will switch to the wired connection. This lead to a plug-and-play setup of the LIDAR which can be double checked through calling the IP adress in a browser. 
