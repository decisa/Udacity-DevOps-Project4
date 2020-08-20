#!/usr/bin/env bash
project_name=DevOps-Project4-Servers
network_config=servers.yml
network_params=servers-params.json
region=us-west-2

aws cloudformation update-stack \
--stack-name $project_name \
--template-body file://$network_config \
--parameters file://$network_params \
--region=$region \
--capabilities CAPABILITY_NAMED_IAM
