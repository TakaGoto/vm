# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

PORTS = [
  8004,
  8000,
  9000,
  7357
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.ssh.forward_agent = true

  PORTS.each do |port|
    config.vm.network "forwarded_port", guest: port, host: port
  end

  EssentialPackages.configure(config)

  NPMPackages.install(config)

  DotFiles.install(config)
end

class EssentialPackages
  def self.configure(config)
    $shell_commands = <<-END
      sudo apt-get update -y
      sudo curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
      sudo apt-get -y install git-core build-essential openssl libssl-dev git vim curl zsh nodejs
    END
    config.vm.provision "shell", inline: $shell_commands
  end
end

class NPMPackages
  PACKAGES = [
    "grunt",
    "grunt-cli",
    "bower",
    "testem",
    "coffee-script",
  ]

  def self.install(config)
    PACKAGES.each do |package|
      config.vm.provision "shell", inline: "sudo npm install #{package} --unsafe-perm -g"
    end
  end
end

class DotFiles
  def self.install(config)
    $shell_commands = <<-END
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
end
