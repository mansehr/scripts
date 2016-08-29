#!/bin/sh

# To run this file simply run this from the command line:
: '
wget https://raw.githubusercontent.com/mansehr/scripts/master/install_opencv.sh
chmod +x install_opencv.sh
nohup ./install_opencv.sh &
'

# http://docs.opencv.org/3.0-last-rst/doc/tutorials/introduction/linux_install/linux_install.html

# Install scripts
sudo apt-get update

# Compiler
sudo apt-get -y install build-essential
# Required
sudo apt-get -y install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
# Optional
sudo apt-get -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

# Clone repos
git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git

# Create build dir
cd ~/opencv
mkdir build
cd build

# Configure build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..

# Build (Updated the number to the number of cores - 1 if you like to do other stuff meanwhile compiling or to the number of cores if not.)
make -j7

# To install the opencv binaries
# sudo make install
