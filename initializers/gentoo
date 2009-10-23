#!/bin/sh

echo "This script will prepare your Gentoo system to use RoR Development Tools"
echo "Press ctrl-c to cancel. Process will start in 5 seconds"
sleep 5
sudo emerge -av ruby rubygems
sudo gem install rake
echo "export PATH=/usr/lib/ruby/gems/1.8/bin:\$PATH" >> ~/.bashrc
export PATH=/var/lib/gems/1.8/bin:$PATH
echo "** Updating rubygems"
sudo gem update --system
echo "** Tasks"
rake -T | grep -e "\:install.*\#"
echo "For details enter:

$ rake -T"

