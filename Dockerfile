FROM ubuntu:15.04
MAINTAINER gpwclark

# Update phusion and install necessary programs
RUN apt-get update && apt-get install -y \
  software-properties-common \
  python-software-properties \
  git \
  wget \
  vim \
  tmux \
  libssl-dev \
  curl \
  ca-certificates 

RUN apt-add-repository -y ppa:fkrull/deadsnakes
RUN apt-get update -y
RUN apt-get install -y python2.5

# Make non sudo user and copy code from git repo to the docker image
RUN useradd -ms /bin/bash user
RUN mkdir -p /home/user/app
ADD . /home/user/app

# set up environment for development
WORKDIR /home/user
RUN wget https://raw.githubusercontent.com/gpwclark/System-files/master/.vimrc
RUN wget https://raw.githubusercontent.com/gpwclark/System-files/master/.tmux.conf
RUN wget https://raw.githubusercontent.com/gpwclark/System-files/master/.bashrc
RUN mkdir -p /home/user/.vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git /home/user/.vim/bundle/Vundle.vim
WORKDIR /home/user/app
RUN bash scapy-2.3.1.zip

# Housekeeping
RUN chown -R user:user /home/user
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER user
