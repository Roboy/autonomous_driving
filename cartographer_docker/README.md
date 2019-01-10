# Description

This is a docker image with installed code from the [Roboy Google Cartographer repository](https://github.com/Roboy/cartographer_ros).
Once a container of this image is created, it will run a roscore exposed to the 11311 port.

## Setup

To build the image run 
```
sudo docker build -t roboy_cartographer . --no-cache
```

To create a docker container run 
```
sudo docker run -it -d -p 11111:11311 --network=host --name roboy_cartographer roboy_cartographer:latest bash
```

## Usage
### Host
It is intended that oyu run `roscore` and all I/O on your host machine. Visualization through `rviz` is also run on the host.

### Docker
through setting `--network=host` docker is in the same network as your host and can therefore interact with `roscore`.

## Work with the docker
### Startup
To start the container:
```
sudo docker start roboy_cartographer
``` 
### Interaction
To enter a docker shell:
```
sudo docker exec -it roboy_cartographer bash
```
### Exiting
To exit the docker, in the docker shell type `exit`
```
root@ubuntu:/home/ros# exit
```

### Stopping
To stop the container:
 ```
 sudo docker stop roboy_cartographer
 ``` 
 
### More useful commands:
 * ```sudo docker kill roboy_cartographer``` forces shutdwon
 * ```sudo docker ps``` (shows active)
 * ```sudo docker ps -a``` (shows all)
