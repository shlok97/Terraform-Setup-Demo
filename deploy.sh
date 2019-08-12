#!/bin/bash

# Use this script to generate servers and deploy the docker image on them after performing the setup

terraform init

terraform destroy <<< "yes"

terraform apply <<< "yes"

TF_STATE=./ ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory playbook.yml
