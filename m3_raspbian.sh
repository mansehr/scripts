#!/bin/sh

# Setup script for the Banana-pi-m3 with Raspbian

# First run raspi-config to increase the storage space
:'
  sudo raspi-config
  sudo reboot
'

sudo apt-get update

sudo apt-get -y install miniupnpc

# Rpi monitor
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F
sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list

sudo apt-get update
sudo apt-get -y install rpimonitor
sudo /etc/init.d/rpimonitor update

## add ip port external_port protocol
upnpc -a 192.168.0.102 8888 28888 tcp

# Install node js
wget https://raw.githubusercontent.com/mansehr/scripts/master/create_nodejs4x.sh
chmod +x create_nodejs4x.sh
./create_nodejs4x.sh
rm create_nodejs4x.sh

# Test opencv
mkdir node_opencv
cd node_opencv
npm install opencv

