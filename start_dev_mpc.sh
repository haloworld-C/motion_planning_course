#!/bin/bash
VERSION="0.01"
ContainerName=mpcController
ImageName=guangaltman/ubuntu18_melodic:dev
#ImageName=tiryoh/ros-melodic-desktop:dev
User=halo2world

#kill and rm exsit container
docker stop $ContainerName > /dev/null 2>&1
docker rm -f $ContainerName > /dev/null 2>&1

docker run -itd \
    --rm \
    -e DISPLAY=unix$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --name $ContainerName \
    --privileged \
    --hostname $User \
    -v /etc/localtime:/etc/localtime \
    -v $(pwd)/L6-homework:/home/$User/catkin_ws/src/mpc \
    $ImageName
    
# -e NVIDIA_DRIVER_CAPABILITIES=all \
# --gpus all\
# --net=host \
# -w /home/ubuntu/catkin_ws \
