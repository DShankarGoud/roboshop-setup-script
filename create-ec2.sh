#!/bin/bash

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" --output table  | grep ImageId | awk '{print $4}')

aws ec2 run-instances --image-id ${AMI_ID} --instance-type t3.micro --instance-market-options "MarketType=spot,SpotOptions={SpotInstanceType=persistent,InstanceInterruptionBehavior=stop}" --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=${NAME}}]" "ResourceType=instance,Tags=[{Key=Name,Value=${NAME}}]" --security-group-ids sg-06b080e7d4a4104a6 &>/dev/null