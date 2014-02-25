#!/bin/bash

# ensure latest version of puppet (3.X)
#wget http://apt.puppetlabs.com/puppetlabs-release-raring.deb
#dpkg -i puppetlabs-release-raring.deb
#rm puppetlabs-release-raring.deb

# install this repo for OpenStack updates
# apt-get install ubuntu-cloud-keyring
# echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu precise-updates/havana main" > /etc/apt/sources.list.d/havana.list

#update and upgrade
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb
rm puppetlabs-release-precise.deb

apt-get update 
#apt-get upgrade -y
#apt-get dist-upgrade -y
apt-get install -y puppet