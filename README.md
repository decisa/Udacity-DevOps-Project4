[![decisa](https://circleci.com/gh/decisa/Udacity-DevOps-Project4.svg?style=svg)](https://app.circleci.com/pipelines/github/decisa/Udacity-DevOps-Project4)

# DevOps Engineer Nanodegree Project 4
- by Artem Telesh

In this project I learned how to successfully containerize and depoloy an application.
I containerized a pre-trained `sklearn` model that has been trained to predict housing prices in Boston based on serveral aspects, like average rooms in home, highway access, teacher to pupil ratios and so on.

## How to run the app
### locally 
- clone the repo
- run `make setup` to create virtual Python environment
- run `source ~/.devops/bin/activate` to activate virtual environment
- run `make install` to install all dependencies for the project
- run `python app.py` to start the app
- in a separate terminal window run `./make_prediction_local.sh` to send input data to the app. local script will send input data to port 80.
- enjoy the results

### docker
- install `docker`
- clone the repo
- run `./run_docker.sh` to build new docker image and run it in a new container
- in a separate terminal window run `./make_prediction.sh` to send input data to the app. this script will send input data to port 8000, which will be forwarded to port 80 inside docker image.
- enjoy the results

### kubernetes
- make sure that `kubectl` and `minikube` are installed
- once docker image is created (in docker section), upload it to docker hub: `./upload_docker.sh`. change dockerhub username inside script if needed. 
- once the image is uploaded, run `./run_kubernetes.sh`. this should create a depoloyment, start the pod, and expose the deployment port via load balancer
- since we deployed on a local machine, we do not have an external IP to test the app. we can use minikube to do the testing. run `minikube service flask-prediction --url`. this will start a tunnel. please note which port is being used (for example http://127.0.0.1:60248  uses port 60248)
- in a separate terminal window run `./make_prediction_minikube.sh PORT_NUMBER`, where PORT_NUMBER is port number from previous step.
- enjoy the results.



## Files  in the prject
- `Dockerfile` - docker configuration file
- `Makefile` - contains commands to make the build and lint process easier
- `app.py` - API for our machine learning app
- `requirements.txt` - list of all dependencies for the project

### shell scripts
- `run_docker.sh` - bash script to build new docker image and run it in a new container
- `upload_docker.sh` - bash script to push image to docker hub
- `run_kubernetes.sh` - bash script to create a deployment, start the pod and expose deployments port
- `make_prediction_local.sh` - bash script to send input data to the app when running the app locally from terminal
- `make_prediction.sh` - bash script to send input data to the app when launched with docker
- `make_prediction_minikube.sh` - bash script to send input data to the app when launched with kubernetes
A short explanation of the files in the repository.


## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl
