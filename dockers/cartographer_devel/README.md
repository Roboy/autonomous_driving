# Cartographer Docker

This is a docker image with installed code from the [Roboy Google Cartographer repository](https://github.com/Roboy/cartographer_ros).

## Setup

### Build Image 
```
sudo docker build -t cartographer_devel . --no-cache
```

### Create Container 
```
sudo docker run -it -d --network=host --name cartographer_devel cartographer_devel:latest bash
```
### Copy files to/from docker 
```
docker cp data/. mycontainer:/root/data/
``` 

## Booting
### Startup
To start the container:
```
sudo docker start cartographer_devel
``` 
### Interaction
To enter a docker shell:
```
sudo docker exec -it cartographer_devel bash
```

## Usage
### Host
It is intended that you run `roscore` and all I/O on your host machine. Visualization through `rviz` is also run on the host. 

### Docker
through setting `--network=host` (compare to setup above), docker is in the same network as your host and can therefore interact with `roscore`.

## Pure Localization Example
After having build a docker as mentioned in cartographer_devel, it is time to set up networking. In this example, we want to run [Google Cartographers pure localization](https://github.com/Roboy/cartographer_ros/tree/roboy) in a `docker` while `roscore` is running on the docker's `host` machine. Visualization is done in `rviz` in a VM on another computer, called `remote`. 

## 1. Setup
It is assumed, you set up a docker as described in cartographer_devel and an `offline`-run has been made to get a `.pbstream` file. Make sure your computers are all connected to the same Network and set your VM to `Bridge Networking`, such that it appears in the network as a stand-alone machine.

- Host Machine (ours has IP 192.168.0.105)
- Docker
- Remote 

## 2. Host
Before starting `roscore` on host, run the following lines of code replacing `HOST_IP` with the actual IP adress of your host machine in each line:
```
export ROS_MASTER_URI=http://192.168.0.105:11311/
export ROS_HOSTNAME=192.168.0.105
export ROS_IP=192.168.0.105
```
Afterwards, run
```
roscore
```

## 3. Remote
First, build [autonomous_driving_src](https://github.com/Roboy/autonomous_driving_src) packages `cartographer_rviz` (in cartographer_ros) and `roboy_ad` are build in your `catkin_ws`.

Before launching `rviz` on remote, run the following lines of code replacing `HOST_IP` with the actual IP adress of your host machine and `REMOTE_IP` with the actual IP adress of your remote machine:
```
export ROS_MASTER_URI=http://192.168.0.105:11311/
export ROS_HOSTNAME=REMOTE_IP
export ROS_IP=REMOTE_IP

```
Afterwards, run
```
roslaunch roboy_ad rviz_cartographer.launch
```

## 4. Docker
### Startup
To start the container:
```
sudo docker start cartographer_devel
``` 
### Interaction
To enter a docker shell:
```
sudo docker exec -it cartographer_devel bash
```
### Source your code
```
source devel/setup.bash
```
### Get data
Download the data from [here](https://drive.google.com/drive/folders/1AyYO9wN8olIHOroJGfmnALDIm3vn1W_s), coy it to docker and SLAM it using the according Roboy offline node. (only needs to be done once!)

### Network Settings
Before starting your code in docker, run the following lines of code replacing `DOCKER_IP` with the actual IP adress of your docker machine in each line:
```
export ROS_MASTER_URI=http://192.168.0.105:11311/
export ROS_HOSTNAME=192.168.0.105
export ROS_IP=192.168.0.105
```
### Start Localization
```
roslaunch cartographer_ros roboy_localization.launch load_state_filename:=${HOME}/data/2019_02_19/utum_5.bag.pbstream
```


## 5. Simulate input
On host, open a new terminal and set network accordingly
```
export ROS_MASTER_URI=http://192.168.0.105:11311/
export ROS_HOSTNAME=192.168.0.XXX
export ROS_IP=192.168.0.XXX
```
run i.e.
```
rosbag play ${HOME}/data/2019_02_19/utum_4.bag --clock
```





### Terminal 4
Assuming you downloaded the UTUM data from [here](https://drive.google.com/drive/folders/1AyYO9wN8olIHOroJGfmnALDIm3vn1W_s), play one of the ROS-bags on your host:
```
rosbag play ${HOME}/data/utum/utum_groundfloor_cw.bag
```
