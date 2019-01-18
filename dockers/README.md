# Description

This is folder contains various docker images for Roboy's autonomous driving code from [here](https://github.com/Roboy/autonomous_driving_src/tree/master). Each subfolder contains docker-specific instructions.

# Docker Basics

## Setup

To build an image run 
```
sudo docker build -t docker_name . --no-cache
```

To create a docker container run 
```
sudo docker run -it -d -p --network=host --name docker_name docker_name:latest bash
```
through setting `--network=host`, docker is in the same network as your host and can therefore interact with `roscore`.


## Work with the docker
### Startup
To start the container:
```
sudo docker start docker_name
``` 
### Interaction
To enter a docker bash:
```
sudo docker exec -it docker_name bash
```
### Exiting
To exit the docker, in the docker shell type `exit`
```
root@ubuntu:/home/ros# exit
```

### Stopping
To stop the container:
 ```
 sudo docker stop docker_name
 ``` 
 
## Useful commands:
 * ```sudo docker kill docker_name``` forces shutdwon of docker docker_name
 * ```sudo docker ps``` (shows active dockers)
 * ```sudo docker ps -a``` (shows all dockers)

# Docker & ROS Networking

After having build a docker as mentioned above, it is time to set up networking. In this example, we want to run [Google Cartographers pure localization](https://github.com/Roboy/cartographer_ros/tree/roboy) in a `docker` while `roscore` is running on the docker's `host` machine. Visualization is done in `rviz` in a VM on another computer, called `remote`. As IP adresses will change during the process, `.bashrc` is not used here.

## 1. Network Info
Firstly, make sure your computers are all connected to the same Network and set your VM to `Bridge Networking`, such that it appears in the network as a stand-alone machine. To get the IP-adresses, run `ifconfig` in terminal of `host`, `docker` and `remote`. If your setup before has been correct, you will notice identical IP adresses `HOST_IP` and `DOCKER_IP` of `host` and `docker`. 

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
Before launching i.e. `rviz` on remote, run the following lines of code replacing `HOST_IP` with the actual IP adress of your host machine and `REMOTE_IP` with the actual IP adress of your remote machine:
```
export ROS_MASTER_URI=http://HOST_IP:11311/
export ROS_HOSTNAME=REMOTE_IP
export ROS_IP=REMOTE_IP
```
Now you can execute your ros commands.

## 4. Docker
Before starting your code in docker, run the following lines of code replacing `DOCKER_IP` with the actual IP adress of your docker machine in each line:
```
export ROS_MASTER_URI=http://DOCKER_IP:11311/
export ROS_HOSTNAME=DOCKER_IP
export ROS_IP=DOCKER_IP
```
Now you can execute your ros commands.

