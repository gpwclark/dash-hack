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
  ca-certificates 

apt-add-repository -y ppa:fkrull/deadsnakes
apt-get update -y
apt-get install -y python2.5
rm /usr/bin/python
ln -s /usr/bin/python2.5 /usr/bin/python

# Make non sudo user and copy code from git repo to the docker image
#RUN useradd -ms /bin/bash user
mkdir -p /home/user/app

# set up environment for development with scapy
unzip /vagrant/scapy-2.3.1.zip
python /home/vagrant/scapy-2.3.1/setup.py install
