#!/bin/bash
VERSION="0.01"
ContainerName=ros2ubuntu16

#kill and rm exsit container
docker stop $ContainerName > /dev/null 2>&1
docker rm -f $ContainerName > /dev/null 2>&1

#CURRENT_FILE_PATH=$(dirname $(dirname "$PWD"))
xhost +
docker run -it \
    -d \
    --name $ContainerName \
    --net=host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --privileged \
    -v "$(pwd):/ws" \
    -v /etc/localtime:/etc/localtime \
    -w /home/ubuntu/catkin_ws \
    --rm \
    tiryoh/ros-kinetic-desktop:base \
    --install all
xhost -
