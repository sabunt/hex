# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  %w[docker db].each do  |vm_name|
    config.vm.define vm_name do |machine|
      machine.vm.box = "generic/ubuntu1804"
      if vm_name == 'docker'
        machine.vm.network :private_network, ip: "192.168.0.10"
        machine.vm.network "forwarded_port", guest: 22, host: 2223
        machine.vm.network "forwarded_port", guest: 80, host: 8080
        machine.vm.network "forwarded_port", guest: 6379, host: 8082
      else
        machine.vm.network :private_network, ip: "192.168.0.11"
        machine.vm.network "forwarded_port", guest: 22, host: 2224
        machine.vm.network "forwarded_port", guest: 5432, host: 8081
      end

      public_key = File.read("#{ENV['HOME']}/.ssh/id_rsa.pub")
      script = <<SCRIPT
        apt install -y python
        echo "#{public_key}" >> /home/vagrant/.ssh/authorized_keys
SCRIPT
      machine.vm.provision :shell, inline: script
    end
  end
end