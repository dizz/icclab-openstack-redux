# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
UBU = true

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :os_ctl do |os_ctl|

    hostname = os_ctl.vm.hostname = "ctl.cloudcomplab.dev"

    # os_ctl.vm.box = "ubuntu13-latest"
    if UBU
      os_ctl.vm.box = "raring-server-cloudimg-vagrant-amd64-disk1"
      os_ctl.vm.box_url = "http://cloud-images.ubuntu.com/raring/current/raring-server-cloudimg-vagrant-amd64-disk1.box"
      os_ctl.vm.provision "shell", path: "ubu-pre-script.sh"
    else
      os_ctl.vm.box = "centos-64-x64-vbox4210"
      os_ctl.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
      os_ctl.vm.provision "shell", path: "centos-pre-script.sh"
    end

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # [--nictype<1-N> Am79C970A|Am79C973|82540EM|82543GC|82545EM|virtio]
    # [--nicpromisc<1-N> deny|allow-vms|allow-all]

    # eth1
    os_ctl.vm.network "private_network", ip: "10.10.10.51"   #, netmask: "255.255.255.0", nic_type: '82545EM'
    # eth2 pub mgt
    os_ctl.vm.network "private_network", ip: "192.168.100.4" #, netmask: "255.255.255.0", nic_type: '82545EM'
    # eth3 egress traffic
    # os_ctl.vm.network "private_network", ip: "192.168.100.5" #, netmask: "255.255.255.0", nic_type: '82545EM'
    
    os_ctl.vm.provider :virtualbox do |vb|
      #vb.gui = true
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      #eth3
      vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
    end

    os_ctl.vm.provision "puppet" do |os_ctl_puppet|
      # let's force that fqdn is set
      os_ctl_puppet.facter         = { "fqdn" => hostname }
      os_ctl_puppet.module_path    = "modules"
      os_ctl_puppet.manifests_path = "manifests"
      os_ctl_puppet.manifest_file  = "site.pp"
      os_ctl_puppet.options        = "--verbose" # --graph --debug
    end
  end

  config.vm.define :os_cmp do |os_cmp|
    hostname = os_cmp.vm.hostname = "cmp.cloudcomplab.dev"
    
    if UBU
      os_cmp.vm.box = "raring-server-cloudimg-vagrant-amd64-disk1"
      os_cmp.vm.box_url = "http://cloud-images.ubuntu.com/raring/current/raring-server-cloudimg-vagrant-amd64-disk1.box"
      os_cmp.vm.provision "shell", path: "ubu-pre-script.sh"
    else
      os_cmp.vm.box = "centos-64-x64-vbox4210"
      os_cmp.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
      os_cmp.vm.provision "shell", path: "centos-pre-script.sh"
    end

    # eth1
    os_cmp.vm.network "private_network", ip: "10.10.10.52" #, netmask: "255.255.255.0", nic_type: '82545EM'

    os_cmp.vm.provider :virtualbox do |vb|
      #vb.gui = true
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      #eth2
      #vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
    end
    
    os_cmp.vm.provision "puppet" do |os_cmp_puppet|
      os_cmp_puppet.facter         = { "fqdn" => hostname }
      os_cmp_puppet.module_path    = "modules"
      os_cmp_puppet.manifests_path = "manifests"
      os_cmp_puppet.manifest_file  = "site.pp"
      os_cmp_puppet.options        = "--verbose" #--debug
    end
  end
end
