#!/usr/bin/env bash
# exit script on errors:
set -e

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
local_name=flask-prediction
docker_user=decisa
dockerpath=$docker_user/$local_name

# Step 2
# Run the Docker Hub container with kubernetes

kubectl create deployment $local_name --image=$dockerpath:latest

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl expose deployment flask-prediction --type=LoadBalancer --port=8000 --target-port=80
kubectl get services

