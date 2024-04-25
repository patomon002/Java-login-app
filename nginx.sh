#!/bin/bash

sudo apt update

sudo apt upgrade -y

sudo apt install dpkg -y

sudo wget https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

sudo apt get-update && sudo apt install -y collectd

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c ssm:/alarm/AWS-CWAgentLinConfig -s

sudo apt install nginx -y

sudo systemctl enable nginx

sudo ufw allow 'Nginx HTTP'

sudo systemctl start nginx

