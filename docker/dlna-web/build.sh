#!/bin/sh

IMG_NAME=${PWD##*/}

docker build -t ${IMG_NAME} .
