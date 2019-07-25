#!/bin/bash

IMAGE_NAME=base
CONTAINER_NAME=$(openssl rand -hex 6)
IP=$(ifconfig en0 | grep 'inet ' | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | head -1)

ln -fs $DISPLAY /tmp/x11_display
open -a XQuartz
xhost + localhost
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:/tmp/x11_display &

docker run --rm									\
		   --privileged							\
		   -dit									\
		   -e DISPLAY=host.docker.internal:0 	\
		   -e XAUTHORITY=$XAUTHORITY 			\
		   -P									\
		   --name $CONTAINER_NAME				\
		   $IMAGE_NAME							\
		   bash

docker exec -it $CONTAINER_NAME bash 
