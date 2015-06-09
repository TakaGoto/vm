# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  $shell_commands = <<-END
    sudo apt-get update -y
    sudo apt-get -y install git vim curl zsh
    chsh -s /bin/zsh vagrant

    git clone https://github.com/TakaGoto/dotfiles.git
    git clone git://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh

    ln -s dotfiles/vim_files .vim
    ln -s dotfiles/vim_files/.vimrc .vimrc
    ln -s dotfiles/tmux_files/.tmux.conf .tmux.conf
    ln -s dotfiles/zsh_files/.zshrc .zshrc

    cd dotfiles && git submodule update --init
  END

  config.vm.provision "shell", inline: $shell_commands
end
