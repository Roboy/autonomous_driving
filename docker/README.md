## Description

This is a docker image with installed code from the [Roboy Autonomous Driving repository](https://github.com/Roboy/autonomous_driving_src).
Once a container of this image is created, it will run a roscore exposed to the 11311 port.

## Usage

To build the image run ```sudo docker build -t roboy_ad .```

To create a docker container run ```sudo docker run -d -p 11111:11311 --name roboy_ad roboy_ad:latest```

To access the roscore inside of the docker container
 * look up your docker ip by running ```docker inspect roboy_ad | grep "IPAddress"```
 * **inside** of docker container run ```export ROS_IP=<docker container IP>```
 * Connect to the docker container by running ```sudo docker exec -t roboy_ad bash```
 * Start ```roscore``` inside of the container
 * In the tab in which you want to access roscore, set ROS_MASTER_URI ```export ROS_MASTER_URI=http://0.0.0.0:11111```
 
More useful commands:

 * ```sudo docker kill roboy_ad``` to stop the container
 * ```sudo docker start roboy_ad``` to restart the container
