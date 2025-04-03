#!/bin/bash

sudo apt update

sudo apt upgrade -y

# sudo apt install dpkg -y

# sudo wget https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

# sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

# sudo apt get-update && sudo apt install -y collectd

# sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c ssm:/alarm/AWS-CWAgentLinConfig -s



sudo useradd -m -d /opt/tomcat -U -s /bin/false tomcat

sudo apt update -y

sudo apt install -y default-jdk

sudo groupadd tomcat

sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

cd /tmp

wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz

sudo mkdir /opt/tomcat

cd /opt/tomcat

sudo tar xzvf apache-tomcat-9.0.89.tar.gz -C /opt/tomcat --strip-components=1

sudo chgrp -R tomcat /opt/tomcat

sudo chmod -R g+r conf

sudo chmod g+x conf

sudo chmod g+x conf

sudo chown -R tomcat webapps/ work/ temp/ logs/
 
sudo echo "[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_Home=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment=’CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC’
Environment=’JAVA_OPTS.awt.headless=true -Djava.security.egd=file:/dev/v/urandom’

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]

WantedBy=multi-user.target" | tee /etc/systemd/system/tomcat.service

sudo systemctl daemon-reload

cd /opt/tomcat/bin

sudo ./startup.sh run

sudo ufw allow 8080



