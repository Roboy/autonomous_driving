## Description

This is a docker image with installed code from the [Roboy Autonomous Driving repository](https://github.com/Roboy/autonomous_driving_src).
Once a container of this image is created, it will run a roscore exposed to the 11311 port.

### Usage

To build the image run 
```
sudo docker build -t roboy_ad .
```

To create a docker container run 
```
sudo docker run -d -p 11111:11311 --name roboy_ad roboy_ad:latest
```
Don't forget to copy files into the docker: ```docker cp dara/. mycontainer:/root/data/``` (mycontainer i.e. 3fab260b5056) 

### In every terminal:
To access the roscore from the docker container, set ROS_MASTER_URI on your host machine: 
```
export ROS_MASTER_URI=http://0.0.0.0:11111
```
enter docker shell
```
sudo docker exec -it roboy_ad bash
```
rviz needs to be run externally, so don't enter the bash but instead do ```rosrun rviz rviz```

### More useful commands:

 * ```sudo docker stop roboy_ad``` to stop the container
 * ```sudo docker kill roboy_ad``` forces shutdwon
 * ```sudo docker start roboy_ad``` to start the container
 * ```sudo docker ps``` (shows active)
 * ```sudo docker container list``` (might also show inactive)
