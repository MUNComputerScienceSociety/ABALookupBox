# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  
  ## Add this if you are trying to run composer update and have memory issues,
  ## just make sure to not commit the uncommented version
  # config.vm.provider "virtualbox" do |vb|
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 9080
  config.vm.network "forwarded_port", guest: 443, host: 9443

  # Share additional folders to the guest VM.
  # ABA Lookup project directory
  config.vm.synced_folder "./ABALookup", "/var/www/ABALookup", :create => "true"

  # Enable provisioning with Puppet stand alone.
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests/"
    puppet.manifest_file  = "site.pp"
    puppet.module_path = "puppet/modules"
    puppet.options = "--hiera_config /vagrant/puppet/hiera.yaml"
  end

end
