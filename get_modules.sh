#! /usr/bin/env bash

mkdir modules
echo "*" > modules/.gitignore
puppet module install puppetlabs/openstack --target-dir ./modules
puppet module install puppetlabs/ntp --target-dir ./modules
git clone http://github.com/joemiller/puppet-newrelic modules/newrelic