#!/bin/bash

sudo apt update

sudo apt upgrade -y

sudo hostnamectl set-hostname Masternode

sudo systemctl enable containerd

