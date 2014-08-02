#!/usr/bin/env bash

# Update all package listings
apt-get update

# Hide the login message
touch /home/vagrant/.hushlogin

# Set default location
echo 'cd /vagrant/ABALookup' >> /home/vagrant/.profile
echo 'PS1="[\u@\h \w] $ "' >> /home/vagrant/.profile
