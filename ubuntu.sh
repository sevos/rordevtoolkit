#!/bin/sh

echo "This script will prepare your Ubuntu system to use RoR Development Tools"
echo "Press ctrl-c to cancel. Process will start in 5 seconds"
sleep 5
sudo apt-get -y install ruby ruby-dev rubygems irb libopenssl-ruby
sudo gem install rake
echo "export PATH=/var/lib/gems/1.8/bin:\$PATH" >> ~/.bashrc
export PATH=/var/lib/gems/1.8/bin:$PATH
echo "** Updating rubygems"
rake module:rubygems:install
echo "** Tasks"
rake -T | grep -e "\:install.*\#"
echo "For details enter:

$ rake -T"

