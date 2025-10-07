#!/bin/bash

IMAGE_NAME="ghcr.io/jkerdreux-imt/dlna-web"

echo "Building Docker image..."
docker build -f ./docker/dlna-web/Dockerfile -t $IMAGE_NAME .

echo "Testing service..."
docker run --rm \
    --network host \
    -e SERVER_PATH="/data: minidlna/" \
    $IMAGE_NAME