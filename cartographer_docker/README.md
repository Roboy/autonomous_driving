## Description

This is a docker image with installed code from the [Roboy Google Cartographer repository](https://github.com/Roboy/cartographer_ros).
Once a container of this image is created, it will run a roscore exposed to the 11311 port.

### Usage

To build the image run 
```
sudo docker build -t roboy_cartographer . --no-cache
```

To create a docker container run 
```
sudo docker run -it -d -p 11111:11311 --network=host --name roboy_cartographer roboy_cartographer:latest bash
```
Don't forget to copy files into the docker (mycontainer i.e. 3fab260b5056, when in bash compare root@mycontainer): 
```
docker cp data/. mycontainer:/root/data/
``` 

### In every terminal:
To access the roscore from the docker container, set ROS_MASTER_URI on your host machine: 
```
export ROS_MASTER_URI=http://0.0.0.0:11111
```
enter docker shell
```
sudo docker exec -it roboy_cartographer bash
```
rviz needs to be run externally, so don't enter the bash but instead do ```rosrun rviz rviz```

### More useful commands:

 * ```sudo docker stop roboy_cartographer``` to stop the container
 * ```sudo docker kill roboy_cartographer``` forces shutdwon
 * ```sudo docker start roboy_cartographer``` to start the container
 * ```sudo docker ps``` (shows active)
 * ```sudo docker container list``` (might also show inactive)
