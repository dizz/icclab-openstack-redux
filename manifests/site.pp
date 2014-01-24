
node /ctl.cloudcomplab.dev/ {

	class {'icclab::controller': }
}	

node /cmp.cloudcomplab.dev/ {

	class {'icclab::compute': }
}

node /mcncc.example.com/ {
	
	$pkgs = [ "zsh", "mc", "firefox", "xorg-x11-xauth" ]
	package { $pkgs: ensure => "installed" }
	
    class { 'openshift_origin' :
		roles             => ['broker','named','activemq','datastore','node'],

		broker_hostname            => 'mcncc.example.com',
		node_hostname              => 'mcncc.example.com',
		named_hostname             => 'mcncc.example.com',
		datastore_hostname         => 'mcncc.example.com',
		activemq_hostname          => 'mcncc.example.com',

		conf_valid_gear_sizes      => ['small', 'medium'],

		bind_key                   => 'CNk+wjszKi9da9nL/1gkMY7H+GuUng==',
		domain                     => 'example.com',
		register_host_with_named   => true,
		conf_named_upstream_dns    => ['8.8.8.8'],

		broker_auth_plugin         => 'mongo',

		development_mode           => true,
		install_cartridges         => ['mongodb', 'python', 'haproxy'],
    }
	
	# clone the devstack repo
	# vcsrepo { "/home/vagrant/devstack":
	# 	ensure 		=> present,
	# 	provider 	=> git,
	# 	source 		=> "https://github.com/openstack-dev/devstack.git",
	# 	user 		=> 'vagrant',
	# 	require 	=> Package["git"],
	# }

	# $localrc_cnt = "
	# ADMIN_PASSWORD=admin
	# MYSQL_PASSWORD=admin
	# RABBIT_PASSWORD=admin
	# SERVICE_PASSWORD=admin
	# SERVICE_TOKEN=admin
	# APACHE_USER=vagrant
	# API_RATE_LIMIT=False"

 #    file { "/home/vagrant/devstack/localrc":
 #      content 	=> "$localrc_cnt",
 #      require 	=> Vcsrepo["/home/vagrant/devstack"],
 #      group		=> "vagrant",
 #      owner		=> "vagrant",
 #    }

	# #run stack.sh as current user (vagrant)
	# exec { "/home/vagrant/devstack/stack.sh":
	# 	cwd     	=> "/home/vagrant/devstack",
	# 	group		=> "vagrant",
	# 	user		=> "vagrant",
	# 	logoutput	=> on_failure,
	# 	timeout		=> 0, # stack.sh takes time!
	# 	require 	=> File["/home/vagrant/devstack/localrc"],
	# }
}
