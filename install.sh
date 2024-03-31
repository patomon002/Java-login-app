#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y apache2

sudo bash

wget https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

dpkg -i -E ./amazon-cloudwatch-agent.deb

yum get-update && yum install -y collectd








