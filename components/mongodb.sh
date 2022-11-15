#!/usr/bin/env bash

source components/common.sh
checkRootUser

ECHO "Setup MongoDB Yum Repo"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>${LOG_FILE}
statusCheck $?

ECHO "Installing MongoDB"
yum install -y mongodb-org &>>${LOG_FILE}
statusCheck $?