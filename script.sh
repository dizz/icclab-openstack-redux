#!/bin/bash

# ensure latest version of puppet (3.X)
wget http://apt.puppetlabs.com/puppetlabs-release-raring.deb
dpkg -i puppetlabs-release-raring.deb
rm puppetlabs-release-raring.deb

#update and upgrade
apt-get update 
apt-get upgrade -y
apt-get dist-upgrade -y