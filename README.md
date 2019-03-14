# Autonomous Driving

This is [Roboy's](https://roboy.org) [Autonomous Driving Team's (update hyperlink when website is up)](https://roboy.org/team/) main repository. Setup and usage is shown in the following sections.

To start, please go to our [Wiki page](https://github.com/Roboy/autonomous_driving/wiki). Members of [Roboy](https://github.com/roboy) can find additional information about this project on our [Confluence page](https://devanthro.atlassian.net/wiki/spaces/WS1819/pages/332071090/Autonomous+Driving). 

# Prerequisites
You will require [ROS Kinetic](http://wiki.ros.org/kinetic) and [Catkin tools](https://catkin-tools.readthedocs.io/en/latest/installing.html) for the use of this repository.

# Code structure
Environmental perception is achieved through the use of a Sick Lidar LMS 155, a IMU and a Intel Realsense Camera. 

In a first iteration, this data is used for generating a map of [our environment](https://www.google.com/maps/dir/Garching+-+Forschungszentrum,+Garching+bei+München/UNTERNEHMERTUM+GMBH,+Lichtenbergstraße+6,+85748+Garching+bei+München/@48.266636,11.6671388,17z/data=!4m14!4m13!1m5!1m1!1s0x479e72ece78d321f:0xf8d2874f0eb7c24c!2m2!1d11.6715693!2d48.2650433!1m5!1m1!1s0x479e728cfa649025:0xd27f72e7835847a7!2m2!1d11.6662132!2d48.2681512!3e2) through the use of [Google Cartographer](https://github.com/Roboy/cartographer_ros/tree/roboy). Based on that map, [our navigation stack](https://github.com/Roboy/autonomous_driving_src/tree/master/navigation) is executed for path planning. Once a path is planned, we use Google Cartographers pure localization feture to find ourselfs on the map. This gives closed-loop feedback to the navigation stack for updating the path planning. 

We output steering parameters an dvelocity settings to the Rickshaw. 

A simulation of the above can be run from [here](https://github.com/Roboy/autonomous_driving_src/tree/master/roboy_models). 

# Code usage
So now that you are here ... what do you want to do?

## Setup

### Hardware
#### LIDAR 
After the stated packages have been build, connect the LIDAR to an appropriate power source (brown = positive -> red, blue = negative -> black) and an ethernet switch. You will need to connect your Laptop to that switch as well. 

Hint for VM users: This guide was written based on experiences from a USB-C only MacBook running Ubuntu 16.04 in VMware Fusion. When connecting ethernet through a ethernet to USB-C adapter, mount the adapter to macOS, such that the connection is shown in the System Preferences of your host machine. Then, disconnect from any WiFi connections and the VM will switch to the wired connection. This lead to a plug-and-play setup of the LIDAR which can be double checked through calling the IP adress in a browser. 

#### Realsense
To check if Intel Realsense D435 was connected correctly check via ```lsusb``` to see if a device with 'Intel' in it's name shows up. There could be problems if you use USB adapters and/or virtual machines, otherwise it should work plug and play.

For instructions on how to use it in ROS check out the [official instructions](https://github.com/intel-ros/realsense).

#### Lidar-Camera extrinsic calibration
Extrinsic calibration provides the relative translation and rotation between camera and lidar.

For a detailed step-by-step [tutorial](https://github.com/Roboy/autonomous_driving/wiki/Calibration:-Extrinsic-calibration-between-camera-and-lidar) visit the Github wiki of this repository.

### Software
Depending on your current configuration, the most straight-forward way to use this code is to clone submodule [`autonomous_driving_src`](https://github.com/Roboy/autonomous_driving_src/tree/master) into your `catkin_ws/src` folder and build it according to the instructions given there.

For Roboy [Rickshaw (update hyperlink)](https://roboy.org) the setup is a little different. We use a docker on our mobile PC (also called `Leia`) for computations. Visualization is done through building `cartographer_rviz` and `roboy_ad` from [`autonomous_driving_src`](https://github.com/Roboy/autonomous_driving_src/tree/master) on another machine and interconnecting them through network.

## Data Recording
See the [README in the roboy_ad package](https://github.com/Roboy/autonomous_driving_src/tree/master/roboy_ad) for detailed instructions.

## SLAM
See the [README in Roboys' branch of Google cartographer](https://github.com/Roboy/cartographer_ros/tree/roboy) for detailed instructions.

## Localization
See the [README in Roboys' branch of Google cartographer](https://github.com/Roboy/cartographer_ros/tree/roboy) for detailed instructions.

## Navigation
See the [README in roboy_naviagtion package](https://github.com/Roboy/autonomous_driving_src/tree/master/roboy_navigation) for detailed instructions.

## Control
See the [README in roboy_naviagtion package](https://github.com/Roboy/autonomous_driving_src/tree/master/roboy_navigation) for detailed instructions.

