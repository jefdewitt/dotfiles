# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "http://files.dryga.com/boxes/osx-sierra-0.3.1.box"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP. This is required to create NFS shared folder.
  config.vm.network "private_network", ip: "192.168.99.33"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  # Use NFS for the shared folder
  config.vm.synced_folder "../..", "/vagrant",
        id: "core",
        :nfs => true,
        :mount_options => ['nolock,vers=3,udp,noatime']

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine. You might want to turn 3D accelerating to speed-up VM GUI.
    vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "2048"

    # Customize motherboard chipset
    # vb.customize ["modifyvm", :id, "--chipset", "ich9"]

    # Customize NAT DNS
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

    # Set resolution on macOS
    # Values: 0 = 640x480, 1 = 800x600, 2 = 1024x768, 3 = 1280x1024, 4 = 1440x900, 5 = 1920x1200
    # vb.customize ["setextradata", :id, "VBoxInternal2/EfiGopMode", "5"]
    # vb.customize ["setextradata", :id, "CustomVideoMode1", "1920x1080x32"]
    # vb.customize ["setextradata", :id, "GUI/CustomVideoMode1", "1920x1080x32"]
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    export DEV_PROJECTS_ROOT=$HOME/proj

    mkdir -p $DEV_PROJECTS_ROOT

    cd $DEV_PROJECTS_ROOT
    cp -R /vagrant/ .

    ./scripts/workflows/new-computer/setup-cj-workstation.sh
  SHELL

end
