# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  $shell_commands = <<-END
    sudo apt-get update -y
    sudo apt-get install git -y
    sudo apt-get install vim -y
    sudo apt-get install curl -y
    sudo apt-get install zsh -y
    chsh -s /bin/zsh vagrant

    git clone https://github.com/TakaGoto/dotfiles.git

    git clone git://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
  END

  config.vm.provision "shell", inline: $shell_commands
end
