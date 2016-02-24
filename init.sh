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

echo "about to add ppa"
apt-add-repository -y ppa:fkrull/deadsnakes
apt-get update -y
apt-get install -y python2.5
echo "python 2.5 installed"

rm /usr/bin/python
ln -s /usr/bin/python2.5 /usr/bin/python

# set up environment for development with scapy
python /vagrant/scapy-2.3.1/setup.py install

#install opencv
#add-apt-repository ppa:gijzelaar/opencv2.4
#apt-get update
#apt-get libcv-dev
