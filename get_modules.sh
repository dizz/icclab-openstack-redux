#! /usr/bin/env bash

puppet module install puppetlabs/openstack --target-dir ./modules
puppet module install puppetlabs/ntp --target-dir ./modules