#!/bin/bash

IMAGE_NAME="ghcr.io/jkerdreux-imt/dlna-web"
CONTAINER_NAME="dlna-web-test"

# Clean up function
cleanup() {
    echo "Stopping container..."
    docker stop $CONTAINER_NAME >/dev/null 2>&1
    docker rm $CONTAINER_NAME >/dev/null 2>&1
    exit 0
}

# Trap Ctrl+C
trap cleanup INT

echo "Building Docker image..."
docker build -f ./docker/dlna-web/Dockerfile -t $IMAGE_NAME .

echo "Testing service..."
docker run --rm \
    --name $CONTAINER_NAME \
    --network host \
    -e SERVER_PATH="/data: minidlna/" \
    $IMAGE_NAME