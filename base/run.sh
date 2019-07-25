#!/bin/bash

IMAGE_NAME=base
CONTAINER_NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)

echo ""
echo "About to run and connect to a containter named '$CONTAINER_NAME', spawn from the image '$IMAGE_NAME'." 
read -n 1 -s -r -p "Press CTRL-C to exit, or any other key to continue."
echo ""

docker run --rm							\
		   -dit							\
		   -e DISPLAY 					\
		   -e XAUTHORITY=$XAUTHORITY 	\
		   -P							\
		   --device /dev/dri			\
		   --name $CONTAINER_NAME		\
		   $IMAGE_NAME					\
		   bash

docker exec -it $CONTAINER_NAME bash 
