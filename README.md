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
The following packages are needed for getting a lidar to work
- sick_scan
- pointcloud_to_laserscan simulates 
- geometry2

**Before building go to submodules geometry2 and pointcloud_to_laserscan and swith branch to indigo-devel**

#### sick_scan
[Sick Scan](http://wiki.ros.org/sick_scan) is the ROS-package provided by the manufacturer of the LiDAR. 
```roslaunch sick_scan sick_mrs_6xxx.launch```
Required to set the according LIDAR IP adress (192.168.1.24)
Double Check through browser 

#### Geometry2
[Geometry2](http://wiki.ros.org/geometry2) is a metapackage to bring in the default packages second generation Transform Library in ROS. Make sure you get the version for kinetic when building (Switch branches!).
In case you run into issues building geometry2 
- test_tf2 apparently doesnt work when building with catkin_make_isolated
- tf2_ ... requires a sudo apt-get install
- it is recommended to build with catkin build

#### pointcloud to laserscan
[Pointcloud_to_Laserscan](http://wiki.ros.org/pointcloud_to_laserscan) converts a 3D Point Cloud into a 2D laser scan. Make sure you get the version for kinetic when building (Switch branches!).

Make sure you set the Params in the launch-file located at
```
src/pointcloud_to_laserscan/launch/sample_node.launch
```
accordingly. Especially, note to LIDAR-dependent set the parameters in lines 20 to 22 in radiants. 
```
angle_min: -1.047
angle_max: 1.047
angle_increment: 0.002268928 
```
launch running
```
roslaunch pointcloud_to_laserscan sample_node.launch
```



### RVIZ
RVIZ (´$ rviz´) is the tool used for visualization
Setup: Choose what you get, either a pointcloud (3d) or a laser scan (2D) and set fixed frame variable accordingly. 


## Google Cartographer ROS
follow instructions to install from [Google Cartographer ROS Docs](https://google-cartographer-ros.readthedocs.io/en/latest/compilation.html) but do a catkin build in the last step. 

Switch to `roboy`-branch.

According files for Roboy are defined. To test with demo bag run:
```roslaunch cartographer_ros roboy_indoor.launch bag_filename:=${HOME}/Downloads/cartographer_paper_deutsches_museum.bag```


### Structure

#### Launch Files
- located at `src/cartographer_ros/cartographer_ros/launch`
- add call for sickscan so we don't have to do it manually`. See here:
```https://github.com/SICKAG/sick_scan/issues/5```
- adapt names to point to according urdf file

#### Configuration Files
- located at `src/cartographer_ros/cartographer_ros/configuration`
- `.lua` files
- compare dokumentation

#### URDF Files
- located at `src/cartographer_ros/cartographer_ros/urdf`
`urdf`-files essentially define the physical configuration of the robot such as relative positions of different sensors. More can be found ´here ROS wiki urdf´

# Hardware Setup

## LIDAR 
After the stated packages have been build, connect the LIDAR to an appropriate power source (brown = positive -> red, blue = negative -> black) and an ethernet switch. You will need to connect your Laptop to that switch as well. 

Hint for VM users: This guide was written based on experiences from a USB-C only MacBook running Ubuntu 16.04 in VMware Fusion. When connecting ethernet through a ethernet to USB-C adapter, mount the adapter to macOS, such that the connection is shown in the System Preferences of your host machine. Then, disconnect from any WiFi connections and the VM will switch to the wired connection. This lead to a plug-and-play setup of the LIDAR which can be double checked through calling the IP adress in a browser. 
