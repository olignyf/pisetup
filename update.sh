#!/bin/bash

##############################
echo "Updating APT REPOS"
sudo apt-get update

##############################
echo "Updating system packages"
sudo apt-get --assume-yes upgrade

##############################
echo "Getting required packages"
sudo apt-get --assume-yes install libfm-dev libfm-gtk-dev libgtk2.0-dev

