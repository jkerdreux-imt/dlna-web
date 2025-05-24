#!/bin/sh

IMG_NAME=${PWD##*/}

docker run -it --rm --net=host ${IMG_NAME} 

