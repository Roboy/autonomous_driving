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
sudo docker run -it -d --network=host --name roboy_ad docker_name:latest bash

```
## Work with the docker
### Startup
To start the container:
```
sudo docker start roboy_ad
``` 
### Interaction
To enter a docker bash:
```
sudo docker exec -it roboy_ad bash
```
