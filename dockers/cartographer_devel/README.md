# Description

This is a docker image with installed code from the [Roboy Google Cartographer repository](https://github.com/Roboy/cartographer_ros).
Once a container of this image is created, it will run a roscore exposed to the 11311 port.

## Setup

To build the image run 
```
sudo docker build -t cartographer_devel . --no-cache
```

To create a docker container run 
```
sudo docker run -it -d --network=host --name cartographer_devel cartographer_devel:latest bash
```

## Work with the docker
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
### Exiting
To exit the docker, in the docker shell type `exit`
```
root@ubuntu:/home/ros# exit
```

### Stopping
To stop the container:
 ```
 sudo docker stop cartographer_devel
 ``` 
 
### More useful commands:
 * ```sudo docker kill cartographer_devel``` forces shutdwon
 * ```sudo docker ps``` (shows active)
 * ```sudo docker ps -a``` (shows all)

## Usage
### Host
It is intended that you run `roscore` and all I/O on your host machine. Visualization through `rviz` is also run on the host. You will need an installation of cartographer (outdated) for this.
```
sudo apt-get install ros-kinetic-cartographer*
```

### Docker
through setting `--network=host` (compare to setup above), docker is in the same network as your host and can therefore interact with `roscore`.

### Example
#### Terminal 1
On host:
```
roscore
```
#### Terminal 2
On host:
```
rosrun rviz rviz
```
Load `roboy_demo_2d.rviz` through `File -> Open Config`
#### Terminal 3
Enter the docker and start cartographer:
```
sudo docker start cartographer_devel
sudo docker exec -it cartographer_devel bash
```
```
source devel/setup.bash
roslaunch cartographer_devel roboy_indoor_online.launch
```
#### Terminal 4
Assuming you downloaded the UTUM data from [here](https://drive.google.com/drive/folders/1AyYO9wN8olIHOroJGfmnALDIm3vn1W_s), play one of the ROS-bags on your host:
```
rosbag play ${HOME}/data/utum/utum_groundfloor_cw.bag
```