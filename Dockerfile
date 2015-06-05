FROM ubuntu:12.04
MAINTAINER Taka Goto <tak.yuki@gmail.com>

ENV HOME /root

RUN apt-get update && \
    apt-get -y install git vim curl zsh

RUN git clone https://github.com/TakaGoto/dotfiles.git

RUN cd dotfiles && \
    git submodule update --init

RUN ln -sf dotfiles/vim_files .vim
RUN ln -sf dotfiles/vim_files/.vimrc .vimrc
RUN ln -sf dotfiles/tmux_files/.tmux.conf .tmux.conf
RUN ln -sf dotfiles/zsh_files/.zshrc .zshrc

RUN git clone git://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
