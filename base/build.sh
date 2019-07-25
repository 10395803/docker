#!/bin/bash

DOCKERFILE=dockerfile
IMAGE_NAME=steubb92:base
IMAGE_SAVE=steubb92_base.tar

echo "About to remove the tar archive '$PWD/$IMAGE_SAVE' (if existing)."
read -n 1 -s -r -p "Press ENTER to continue, CTRL-C to exit, or any other key to bypass this step." key
echo ""

if [[ $key = "" ]]; then
	if [ -f "$IMAGE_SAVE" ]; then
		rm -rf $PWD/$IMAGE_SAVE
	fi
fi

echo ""
echo "About to build the image '$IMAGE_NAME' against the dockerfile '$PWD/$DOCKERFILE'."
read -n 1 -s -r -p "Press ENTER to continue, CTRL-C to exit, or any other key to bypass this step." key
echo ""

if [[ $key = "" ]]; then
	docker build --rm -f $DOCKERFILE -t $IMAGE_NAME .
fi

echo ""
echo "About to save the image '$IMAGE_NAME' to the tar archive '$PWD/$IMAGE_SAVE'."
read -n 1 -s -r -p "Press ENTER to continue, CTRL-C to exit, or any other key to bypass this step." key
echo ""

if [[ $key = "" ]]; then
	docker save --output $IMAGE_SAVE $IMAGE_NAME
fi
