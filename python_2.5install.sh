#!/bin/bash

echo "about to add ppa"
apt-add-repository -y ppa:fkrull/deadsnakes
apt-get update -y
apt-get install -y python2.5
echo "python 2.5 installed"

rm /usr/bin/python
ln -s /usr/bin/python2.5 /usr/bin/python

# set up environment for development with scapy
cd /vagrant/scapy-2.3.1/ && python /vagrant/scapy-2.3.1/setup.py install
