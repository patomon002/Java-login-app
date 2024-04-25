#!/bin/bash

# sudo yum update
# sudo yum upgrade -y

# sudo wget https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

# sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

# sudo yum get-update && sudo yum install -y collectd

# sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c ssm:/alarm/AWS-CWAgentLinConfig -s

# sudo hostnamectl set-hostname maven

sudo dnf update

sudo dnf upgrade -y
 
sudo dnf install maven -y

