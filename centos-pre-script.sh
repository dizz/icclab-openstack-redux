#!/bin/bash

# ensure latest version of puppet (3.X)
rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm

#openstack repositories
yum install -y http://rdo.fedorapeople.org/openstack/openstack-grizzly/rdo-release-grizzly.rpm
yum install -y http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

#update and upgrade
yum update -y