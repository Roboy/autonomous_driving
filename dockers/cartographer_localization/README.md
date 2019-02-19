# Pure Localization

At the end of the semester, this will contain a docker idling in pure_localization mode. No entering the shell will be necessary. Until this is set up, this README hosts instructions on how to run pure localizatio on `LEIA`.

After having build a docker as mentioned in cartographer_devel, it is time to set up networking. In this example, we want to run [Google Cartographers pure localization](https://github.com/Roboy/cartographer_ros/tree/roboy) in a `docker` while `roscore` is running on the docker's `host` machine. Visualization is done in `rviz` in a VM on another computer, called `remote`. 

## 1. Setup
It is assumed, you set up a docker as described in cartographer_devel and an `offline`-run has been made to get a `.pbstream` file. Make sure your computers are all connected to the same Network and set your VM to `Bridge Networking`, such that it appears in the network as a stand-alone machine.

- Host Machine
- Docker
- Remote 

## 2. Host
Before starting `roscore` on host, run the following lines of code replacing `HOST_IP` with the actual IP adress of your host machine in each line:
```
export ROS_MASTER_URI=http://HOST_IP:11311/
export ROS_HOSTNAME=HOST_IP
export ROS_IP=HOST_IP
```
Afterwards, run
```
roscore
```

## 3. Remote
First, build [autonomous_driving_src](https://github.com/Roboy/autonomous_driving_src) packages `cartographer_rviz` (in cartographer_ros) and `roboy_ad` are build in your `catkin_ws`.

Before launching `rviz` on remote, run the following lines of code replacing `HOST_IP` with the actual IP adress of your host machine and `REMOTE_IP` with the actual IP adress of your remote machine:
```
export ROS_MASTER_URI=http://HOST_IP:11311/
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

### Network Settings
Before starting your code in docker, run the following lines of code replacing `DOCKER_IP` with the actual IP adress of your docker machine in each line:
```
export ROS_MASTER_URI=http://DOCKER_IP:11311/
export ROS_HOSTNAME=DOCKER_IP
export ROS_IP=DOCKER_IP
```
### Start Localization
```
roslaunch cartographer_ros roboy_localization.launch load_state_filename:=${HOME}/data/2019_02_19/utum_5.bag.pbstream
```


## 5. Simulate input
On host, open a new terminal and set network accordingly
```
export ROS_MASTER_URI=http://HOST_IP:11311/
export ROS_HOSTNAME=HOST_IP
export ROS_IP=HOST_IP
```
run i.e.
```
rosbag play ${HOME}/data/2019_02_19/utum_4.bag
```


## FAQ:

Error `Unsupported serialization format "2"`: This indicates that your `.pbstream`-map is outdated. To fix, run cartographer offline but in docker (also a nice way to check your network settings) using i.e.:
```
roslaunch cartographer_ros roboy_indoor_offline.launch bag_filenames:=${HOME}/data/utum/utum_groundfloor_cw.bag
```
