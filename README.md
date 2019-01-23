# Autonomous Driving

This is [Roboy's Autonomous Driving Team's (update hyperlink when website is up)](https://roboy.org) main page. 

# Prerequisites
You will require [ROS Kinetic](http://wiki.ros.org/kinetic) and [Catkin tools](https://catkin-tools.readthedocs.io/en/latest/installing.html) for the use of this repository.

# Code structure
Environmental perception is achieved through the use of a Sick Lidar LMS 1xx and a Intel Realsense Camera. 

In a first iteration, this data is used for generating a map of [our environment](https://www.google.com/maps/dir/Garching+-+Forschungszentrum,+Garching+bei+München/UNTERNEHMERTUM+GMBH,+Lichtenbergstraße+6,+85748+Garching+bei+München/@48.266636,11.6671388,17z/data=!4m14!4m13!1m5!1m1!1s0x479e72ece78d321f:0xf8d2874f0eb7c24c!2m2!1d11.6715693!2d48.2650433!1m5!1m1!1s0x479e728cfa649025:0xd27f72e7835847a7!2m2!1d11.6662132!2d48.2681512!3e2) through the use of [Google Cartographer](https://github.com/Roboy/cartographer_ros/tree/roboy). Based on that map, [our navigation stack](https://github.com/Roboy/autonomous_driving_src/tree/master/navigation) is executed for path planning. Once a path is planned, we use Google Cartographers pure localization feture to find ourselfs on the map. This gives closed-loop feedback to the navigation stack for updating the path planning.

A simulation of the above can be run from [here](https://github.com/Roboy/autonomous_driving_src/tree/master/roboy_models). 


# Software Setup
Depending on your current configuration, the most straight-forward way to use this code is to clone submodule [`autonomous_driving_src`](https://github.com/Roboy/autonomous_driving_src/tree/master) into your `catkin_ws/src` folder and build it according to the instructions given there.

For Roboy [Rickshaw (update hyperlink)](https://roboy.org) the setup is a little different. We use docker on our mobile PC (also called `Leia`) for ... . Visualization is done through building `cartographer_rviz` and `roboy_ad` from [`autonomous_driving_src`](https://github.com/Roboy/autonomous_driving_src/tree/master) on another machine. 

# Hardware Setup

## LIDAR 
After the stated packages have been build, connect the LIDAR to an appropriate power source (brown = positive -> red, blue = negative -> black) and an ethernet switch. You will need to connect your Laptop to that switch as well. 

Hint for VM users: This guide was written based on experiences from a USB-C only MacBook running Ubuntu 16.04 in VMware Fusion. When connecting ethernet through a ethernet to USB-C adapter, mount the adapter to macOS, such that the connection is shown in the System Preferences of your host machine. Then, disconnect from any WiFi connections and the VM will switch to the wired connection. This lead to a plug-and-play setup of the LIDAR which can be double checked through calling the IP adress in a browser. 

## Realsense
@jonas-kerber

## Lidar-Camera extrinsic calibration
Extrinsic calibration provides the relative translation and rotation between camera and lidar.

For a detailed step-by-step [tutorial](https://github.com/Roboy/autonomous_driving/wiki/Calibration:-Extrinsic-calibration-between-camera-and-lidar) visit the Github wiki of this repository.
