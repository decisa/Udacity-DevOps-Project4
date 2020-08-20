#!/usr/bin/env bash
project_name=DevOps-Project4
network_config=network.yml
network_params=network-params.json
region=us-west-2

aws cloudformation update-stack \
--stack-name $project_name \
--template-body file://$network_config \
--parameters file://$network_params \
--region=$region \
