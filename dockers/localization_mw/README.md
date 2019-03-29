# Cartographer Docker

This is a docker image with installed localization code from the [Roboy Google Cartographer repository](https://github.com/Roboy/cartographer_ros). It expects ROS_CORE @ `192.168.0.105`. 

## Setup

### Build Image 
```
sudo docker build -t localization_mw . --no-cache
```

### Create Container 
```
sudo docker run -it -d --network=host --name localization_mw localization_mw:latest bash
```

## Booting
### Startup
To start the container:
```
sudo docker start localization_mw
``` 

### Get data
Download the data from [here](https://drive.google.com/drive/folders/1AyYO9wN8olIHOroJGfmnALDIm3vn1W_s), coy it to docker and SLAM it using the according Roboy offline node. (only needs to be done once!)
