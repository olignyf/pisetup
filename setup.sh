#!/bin/bash

##############################
echo "Enabling SSH"
sudo systemctl enable ssh.service
sudo systemctl restart ssh.service

##############################
echo "Installing showip LXPANEL"
sudo apt-get install libfm-dev libfm-gtk-dev
git clone https://github.com/olignyf/raspberry-pi-showip.git
cd raspberry-pi-showip
make
cp showip.so /usr/lib/arm-linux-gnueabihf/lxpanel/plugins/
lxpanelctl restart

##############################
echo "Installing samba server"
sudo apt-get install samba
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.ori
sudo cp smb.conf /etc/samba/
sudo systemctl enable samba.service
sudo systemctl restart samba.service


