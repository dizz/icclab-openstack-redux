#! /usr/bin/env bash

mkdir modules
echo "*" > modules/.gitignore
puppet module install puppetlabs/ntp --target-dir ./modules
puppet module install puppetlabs/lvm --target-dir ./modules
puppet module install puppetlabs/openstack --target-dir ./modules --version 3.0.0-rc1

git clone https://github.com/joemiller/puppet-newrelic modules/newrelic
git clone https://github.com/stackforge/puppet-ceilometer modules/ceilometer
git clone https://github.com/stackforge/puppet-savanna modules/savanna
git clone https://github.com/stackforge/puppet-heat modules/heat
git clone https://github.com/dizz/icclab-os modules/icclab 
git clone https://github.com/dizz/icclab-ryu modules/ryu

git clone https://github.com/openshift/puppet-openshift_origin modules/openshift_origin
git clone https://github.com/puppetlabs/puppetlabs-vcsrepo modules/puppetlabs-vcsrepo

# git clone https://github.com/stackforge/puppet-openstack -b stable/havana modules/openstack
# gem install librarian-puppet
# cd modules/openstack
# librarian-puppet install --path ../
# cd ../..
