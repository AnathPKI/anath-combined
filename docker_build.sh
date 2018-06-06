#!/bin/bash

IMAGE=anathpki/combined:latest

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

echo "## Building image $IMAGE"
docker build . -t "${IMAGE}"
echo "## Pushing image $IMAGE"
docker push "${IMAGE}"
