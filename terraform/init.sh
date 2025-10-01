#!/bin/bash


cd "/t/MY PROJECT/root/networking"
terraform init
terraform plan

cd "/t/MY PROJECT/root/security group"
terraform init
terraform plan

cd "/t/MY PROJECT/root/compute ec2"
terraform init
terraform plan

cd "/t/MY PROJECT/root/ami"
terraform init
terraform plan

cd "/t/MY PROJECT/root/launch template"
terraform init
terraform plan