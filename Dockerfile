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
  unzip \
  tcpdump \
  graphviz \
  imagemagick \
  python-gnuplot \
  python-crypto \
  python-pyx \
  ca-certificates 

RUN apt-add-repository -y ppa:fkrull/deadsnakes
RUN apt-get update -y
RUN apt-get install -y python2.5
RUN rm /usr/bin/python
RUN ln -s /usr/bin/python2.5 /usr/bin/python

# Make non sudo user and copy code from git repo to the docker image
#RUN useradd -ms /bin/bash user
RUN mkdir -p /home/user/app
ADD . /home/user/app

# set up environment for development with scapy
WORKDIR /home/user
RUN wget https://raw.githubusercontent.com/gpwclark/System-files/master/.vimrc
RUN wget https://raw.githubusercontent.com/gpwclark/System-files/master/.tmux.conf
RUN wget https://raw.githubusercontent.com/gpwclark/System-files/master/.bashrc
RUN mkdir -p /home/user/.vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git /home/user/.vim/bundle/Vundle.vim
WORKDIR /home/user/app
RUN unzip scapy-2.3.1.zip
WORKDIR /home/user/app/scapy-2.3.1
#RUN sed -i '3006s/.*/bind_layers(IPv6, IP, nh = 4 )/' scapy/layers/inet6.py
RUN python setup.py install
#RUN rm /usr/lib/python2.5/site-packages/scapy/layers/inet6.pyc
WORKDIR /home/user/app

# Housekeeping
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

