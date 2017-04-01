#!/bin/bash

##############################
echo "Enabling SSH"
sudo systemctl enable ssh.service
sudo systemctl restart ssh.service

##############################
echo "Installing showip LXPANEL"
git clone https://github.com/olignyf/raspberry-pi-showip.git
cd raspberry-pi-showip
make
sudo python install.py
cd ..

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



