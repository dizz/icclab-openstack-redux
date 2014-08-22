#!/bin/bash

#update and upgrade
wget http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i puppetlabs-release-trusty.deb
rm puppetlabs-release-trusty.deb

apt-get update
#apt-get upgrade -y
#apt-get dist-upgrade -y
apt-get install -y puppet
