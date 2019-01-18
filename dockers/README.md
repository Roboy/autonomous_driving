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

