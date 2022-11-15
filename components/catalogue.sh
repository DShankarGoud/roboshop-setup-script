#!/usr/bin/env bash

ECHO "Configure NodeJS Yum Repos"
curl -sL https://rpm.nodesource.com/setup_16.x | bash &>>${LOG_FILE}
statusCheck $?

ECHO "Install NodeJS"
yum install nodejs -y gcc-c++ -y &>>${LOG_FILE}
statusCheck $?


id roboshop &>>${LOG_FILE}
if [ $? -ne 0 ]; then
  ECHO "Add Application User"
  useradd roboshop &>>${LOG_FILE}
  statusCheck $?
fi

ECHO "Download Application Content"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>${LOG_FILE}
statusCheck $?

