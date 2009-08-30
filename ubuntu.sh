#!/bin/sh

echo "This script will prepare your Ubuntu system to use RoR Development Tools"
echo "Press ctrl-c to cancel. Process will start in 5 seconds"
sleep 5
sudo apt-get -y install ruby ruby-dev rubygems irb
sudo gem install rake
echo "export PATH=/var/lib/gems/1.8/bin:\$PATH" >> ~/.bashrc
echo "*** Common tasks ***"
/var/lib/gems/1.8/bin/rake -T | grep -e "\:all"
echo "Enter\n    rake -T\nfor details"
