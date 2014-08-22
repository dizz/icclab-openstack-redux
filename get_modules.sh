#! /usr/bin/env bash

# checking if modules exists
if [ -d modules ]
then
	echo "modules folder already exists, deleting it"
	rm -rf modules/
fi

mkdir modules
echo "*" > modules/.gitignore
puppet module install puppetlabs/ntp --target-dir ./modules
puppet module install puppetlabs/lvm --target-dir ./modules

# puppet module install puppetlabs/openstack --target-dir ./modules
git clone https://github.com/dizz/puppet-openstack ./modules/openstack
#-b origin/stable/havana
gem install librarian-puppet
cd modules/openstack
librarian-puppet install --path ../
cd ../..

git clone https://github.com/joemiller/puppet-newrelic ./modules/newrelic
git clone https://github.com/stackforge/puppet-ceilometer ./modules/ceilometer
git clone https://github.com/stackforge/puppet-sahara ./modules/sahara
git clone https://github.com/stackforge/puppet-heat ./modules/heat
git clone https://github.com/dizz/icclab-os ./modules/icclab
