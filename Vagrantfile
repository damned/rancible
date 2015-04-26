# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define :ubuntuvm do |server|
    server.vm.box       = 'trusty64'
    server.vm.box_url   = 'http://files.vagrantup.com/precise64.box'
    server.vm.host_name = 'ubuntuvm'
    server.vm.network :forwarded_port, guest: 80, host: 8080
    server.vm.network :private_network, ip: '192.168.33.159'
  end
end
