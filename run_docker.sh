#!/usr/bin/env bash
# exit script on errors
set -e

local_name=flask-prediction

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t $local_name:latest .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
# docker run --name=flask_container -p 80:80 flask_prediction
docker run -p 8000:80 $local_name
