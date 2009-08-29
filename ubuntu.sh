#!/bin/sh

echo -e "This script will prepare your Ubuntu system to use RoR Development Tools"
echo -e "Press ctrl-c to cancel. Process will start in 5 seconds"
sleep 5
sudo apt-get -y install ruby ruby-dev rubygems
echo "export PATH=/var/lib/gems/1.8/bin:\$PATH" >> ~/.bashrc
echo "*** Common tasks ***"
rake -T | grep -e "\:all"
echo "Enter\n    rake -T\nfor details"
