#!/bin/bash

sudo yum update
sudo yum upgrade -y

sudo wget https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

sudo yum get-update && sudo yum install -y collectd

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c ssm:/alarm/AWS-CWAgentLinConfig -s

sudo hostnamectl set-hostname maven

cd /opt

sudo yum install wget nano tree unzip git-all -y

sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y

sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip


sudo unzip apache-maven-3.9.6-bin.zip

sudo rm -rf apache-maven-3.9.6-bin.zip

sudo mv apache-maven-3.9.6/ maven

sudo echo export M2_HOME=/opt/maven >> ~/.bash_profile 

sudo echo export PATH=$PATH:$M2_HOME/bin >> ~/.bash_profile 