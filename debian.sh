#!/bin/sh

echo "This script will prepare your Debian system to use RoR Development Tools"
echo "Press ctrl-c to cancel. Process will start in 5 seconds"
sleep 5
sudo apt-get -y install make ruby ruby-dev rubygems irb libopenssl-ruby libfcgi-dev g++
sudo gem install rake
echo "export PATH=/var/lib/gems/1.8/bin:\$PATH" >> ~/.bashrc
export PATH=/var/lib/gems/1.8/bin:$PATH
echo "** Updating rubygems"
sudo gem install rubygems-update -v 1.3.1
sudo PATH=/var/lib/gems/1.8/bin:$PATH update_rubygems
sudo gem install hoe -v 2.0.0
rake module:rubygems:install
echo "** Tasks"
rake -T | grep -e "\:install.*\#"
echo "For details enter:

$ rake -T"

