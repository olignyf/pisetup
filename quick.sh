#!/bin/bash

##############################
echo "Updating APT REPOS"
sudo apt-get update

##############################
echo "Getting required packages"
sudo apt-get --assume-yes install libfm-dev libfm-gtk-dev

##############################
echo "Doing initial setup"
./core.sh

