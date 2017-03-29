#!/bin/bash

##############################
echo "Enabling SSH"
sudo systemctl enable ssh.service
sudo systemctl restart ssh.service

##############################
echo "Updating APT REPOS"
sudo apt-get update

##############################
echo "Updating system packages"
sudo apt-get --assume-yes upgrade

##############################
echo "Installing showip LXPANEL"
sudo apt-get --assume-yes install libfm-dev libfm-gtk-dev
git clone https://github.com/olignyf/raspberry-pi-showip.git
cd raspberry-pi-showip
make
cp showip.so /usr/lib/arm-linux-gnueabihf/lxpanel/plugins/
lxpanelctl restart

##############################
echo "Installing samba server"
pwd
sudo apt-get --assume-yes install samba samba-common-bin
sudo service smbd restart
sudo service nmbd restart
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.ori
sudo cp smb.conf /etc/samba/
sudo service smbd restart
(echo raspberry; echo raspberry) | sudo smbpasswd -a pi



