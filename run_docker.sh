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
echo 
echo 
echo "! ! Important ! !"
echo
echo "* -------------------------------------------------------------------- *"
echo "|                                                                      |"
echo "|  docker is exposed on port 8000. please check front end version at:  |"
echo "|  http://localhost:8000                                               |"
echo "|                                                                      |"
echo "* -------------------------------------------------------------------- *"
echo
echo
docker run -p 8000:80 $local_name
