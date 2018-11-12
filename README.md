# Repository Structure
The folder '/src' is intended to simply be cloned into the needed catkin workspace. Within src, the packages stated in section X are included. For setup from scratch, follow the according guide. 

# Packages

## Prerequisites
### ROS Kinetic
install as here

### Rosbridge_sute
install as here

### catkin tools
for catkin build

## LiDAR
The following packages are needed for getting a lidar to work
- sick_scan
- pointcloud2 to laserscan simulates 
- geometry2

### Setup
After the stated packages have been build, connect the LIDAR to an appropriate power source (brown = positive -> red, blue = negative -> black) and an ethernet switch. You will need to connect your Laptop to that switch as well. 

Hint for VM users: This guide was written based on experiences from a USB-C only MacBook running Ubuntu 16.04 in VMware Fusion. When connecting ethernet through a ethernet to USB-C adapter, mount the adapter to macOS, such that the connection is shown in the System Preferences of your host machine. Then, disconnect from any WiFi connections and the VM will switch to the wired connection. This lead to a plug-and-play setup of the LIDAR which can be double checked through calling the IP adress in a browser. 

#### sick_scan
Source:
Scan-Package from developer of lidar (Sick)
Required to set the according LiDAR IP adress (192.168.1.24)
Double Check through browser 

#### Geometry2
In case you run into issues building geometry2 
- test_tf2 apparently doesnt work when building with catkin_make_isolated
- tf2_ ... requires a sudo apt-get install
- it is recommended to build with catkin build

#### pointcloud2 to laserscan
Source:
Make sure you set the Params in the launch-file located at
´´´
src/pointcloud_to_laserscan/launch/sample_node.launch
´´´
accordingly. Especially, note to LIDAR-dependent set the parameters in lines 20 to 22 in radiants. 
´´´
angle_min: -1.047
angle_max: 1.047
angle_increment: 0.002268928 
´´´




### RIVZ
RVIZ (´$ rviz´) is the tool used for visualization
Setup: Choose what you get, either a pointcloud (3d) or a laser scan (2D) and set fixed frame variable accordingly. 


## Google Cartographer ROS
follow instructions to install from here but do a catkin build in the last step. 

start with the backpack_2d files and modify them for roboy!

### src/cartographer_ros/cartographer_ros/urdf
´urdf´-files essentially define the physical configuration of the robot such as relative positions of different sensors. More can be found ´here ROS wiki urdf´

### src/cartographer_ros/cartographer_ros/launch
- add call for sickscan so we don't have to do it manually
- adapt names to point to according urdf file



### src/cartographer_ros/cartographer_ros/configuration
- .lua files
- compare dokumentation
