#!/bin/bash

echo "Installing showip LXPANEL"
sudo apt-get install libfm-dev libfm-gtk-dev
git clone https://github.com/olignyf/raspberry-pi-showip.git
cd raspberry-pi-showip
make
cp showip.so /usr/lib/arm-linux-gnueabihf/lxpanel/plugins/

echo "Installing samba server"
sudo apt-get install samba