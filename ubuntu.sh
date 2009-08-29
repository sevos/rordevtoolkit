#!/bin/sh

echo -e "This script will prepare your Ubuntu system to use RoR Development Tools"
sudo apt-get install ruby ruby-dev rubygems
echo "export PATH=/var/lib/gems/1.8/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
sudo gem install rake
rake -T | grep -e "\:all"
echo -e "Enter\n    rake -T\nfor details"
