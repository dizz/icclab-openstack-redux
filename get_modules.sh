#! /usr/bin/env bash

mkdir modules
echo "*" > modules/.gitignore
puppet module install puppetlabs/ntp --target-dir ./modules
puppet module install puppetlabs/lvm --target-dir ./modules

git clone http://github.com/joemiller/puppet-newrelic modules/newrelic
git clone https://github.com/stackforge/puppet-ceilometer.git modules/ceilometer
git clone https://github.com/dizz/icclab-puppet-savanna.git modules/savanna
git clone https://github.com/stackforge/puppet-heat.git modules/heat
git clone http://github.com/dizz/icclab-os modules/icclab 
git clone https://github.com/stackforge/puppet-openstack.git modules/openstack
git clone https://github.com/dizz/icclab-ryu.git modules/ryu

gem install librarian-puppet
cd modules/openstack
librarian-puppet install --path ../

cd ../..
