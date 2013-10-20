#! /usr/bin/env bash

mkdir modules
echo "*" > modules/.gitignore
# puppet module install puppetlabs/openstack --target-dir ./modules
puppet module install puppetlabs/ntp --target-dir ./modules
git clone http://github.com/joemiller/puppet-newrelic modules/newrelic

git clone git@github.com:dizz/puppet-openstack.git -b stable/grizzly modules/openstack
gem install librarian-puppet
cd modules/openstack
librarian-puppet install --path ../

cd ../..
git clone git@github.com:dizz/icclab-puppet-savanna.git modules/savanna

git clone http://github.com/dizz/icclab-os modules/icclab