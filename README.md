# Autonomous Driving

# Prerequisites
## ROS Kinetic
[ROS Kinetic](http://wiki.ros.org/kinetic)

## Rosbridge_suite
Make sure you get [ROSbridge suite](http://wiki.ros.org/rosbridge_suite)'s kinetic version!

## Catkin Tools
[Catkin tools](https://catkin-tools.readthedocs.io/en/latest/installing.html) for the use of catkin build.

# Install
Clone submodule `autonomous_driving_src` into your `catkin_ws/src` folder and build according to instructions there.

# Hardware Setup

## LIDAR 
After the stated packages have been build, connect the LIDAR to an appropriate power source (brown = positive -> red, blue = negative -> black) and an ethernet switch. You will need to connect your Laptop to that switch as well. 

Hint for VM users: This guide was written based on experiences from a USB-C only MacBook running Ubuntu 16.04 in VMware Fusion. When connecting ethernet through a ethernet to USB-C adapter, mount the adapter to macOS, such that the connection is shown in the System Preferences of your host machine. Then, disconnect from any WiFi connections and the VM will switch to the wired connection. This lead to a plug-and-play setup of the LIDAR which can be double checked through calling the IP adress in a browser. 

## Lidar-Camera extrinsic calibration
Extrinsic calibration provides the relative translation and rotation between camera and lidar.

For a detailed step-by-step [tutorial](https://github.com/Roboy/autonomous_driving/wiki/Calibration:-Extrinsic-calibration-between-camera-and-lidar) visit the Github wiki of this repository.
