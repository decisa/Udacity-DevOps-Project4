#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`
set -e

# Step 1:
# Create dockerpath
local_name=flask_prediction
docker_user=decisa
dockerpath=$docker_user/$local_name

# Step 2:  
# log out current docker user and login the one we want to upload to
# Authenticate & tag
docker logout
echo "please enter password for docker user: $docker_user :"
docker login -u $docker_user
docker tag $local_name $dockerpath
echo "Docker ID and Image: $dockerpath"


# Step 3:
# Push image to a docker repository
docker push $dockerpath
