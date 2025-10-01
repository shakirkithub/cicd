#!/bin/bash

cd "/t/MY PROJECT/root/compute ec2"
terraform destroy -auto-approve

cd "/t/MY PROJECT/root/security group"
terraform destroy -auto-approve

cd "/t/MY PROJECT/root/networking"
terraform destroy -auto-approve

cd "/t/MY PROJECT/root/launch template"
terraform destroy -auto-approve

cd "/t/MY PROJECT/root/ami"
terraform destroy -auto-approve