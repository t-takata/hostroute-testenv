# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.define "hostroute_host" do |v|
    v.vm.hostname = "hostroute-host"
    v.vm.box = "centos/7"
    v.vm.network "private_network", ip: "100.64.0.10", virtualbox__intnet: "global_nexthop_0"
    # and 198.51.100.10/32
    
    v.vm.provider "virtualbox" do |vm|
      vm.memory = 512
    end
    v.vm.provision "shell", inline: "sh /vagrant/hostroute_host/setup.sh"
  end

  config.vm.define "router" do |v|
    v.vm.hostname = "router"
    v.vm.box = "higebu/vyos"
    v.vm.network "private_network", ip: "100.64.0.1", virtualbox__intnet: "global_nexthop_0"
    v.vm.network "private_network", ip: "203.0.113.1", virtualbox__intnet: "global_0"

    v.vm.provider "virtualbox" do |vm|
      vm.memory = 512
    end
    v.vm.provision "shell", inline: "sh /vagrant/router/setup.sh"
  end

  config.vm.define "global_host" do |v|
    v.vm.hostname = "global-host"
    v.vm.box = "centos/7"
    v.vm.network "private_network", ip: "203.0.113.10", virtualbox__intnet: "global_0"

    v.vm.provider "virtualbox" do |vm|
      vm.memory = 512
    end
    v.vm.provision "shell", inline: "sh /vagrant/global_host/setup.sh"
  end
end
