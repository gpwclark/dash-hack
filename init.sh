#!/bin/bash

apt-get update && apt-get install -y \
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
  lxde \
  firefox \
  default-jre \
  cmake \
  libtiff \
  autoconf \
  libtool \
  libtesseract3 \
  wmctrl \
  swig \
  ca-certificates 

apt-add-repository -y ppa:fkrull/deadsnakes
apt-get update -y
apt-get install -y python2.5

rm /usr/bin/python
ln -s /usr/bin/python2.5 /usr/bin/python

# set up environment for development with scapy
# unzip scapy don't commit it!!!!!!!!!!

cd /vagrant/ && unzip scapy-2.3.1.zip && python /vagrant/scapy-2.3.1/setup.py install

# install opencv
bash opencv2_4_9.sh
