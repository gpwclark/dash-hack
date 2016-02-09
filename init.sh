#apt-get update && apt-get install -y \
#  software-properties-common \
#  python-software-properties \
#  git \
#  wget \
#  vim \
#  tmux \
#  libssl-dev \
#  curl \
#  unzip \
#  tcpdump \
#  graphviz \
#  imagemagick \
#  python-gnuplot \
#  python-crypto \
#  python-pyx \
#  lxde \
#  firefox \
#  default-jre \
#  cmake \
#  libtiff \
#  autoconf \
#  libtool \
#  swig \
#  ca-certificates 

#leptonicaa (for OCR)
#git clone https://github.com/danbloomberg/leptonica
#https://bbs.archlinux.org/viewtopic.php?id=161452 (complex)

#install tesseract
#git clone https://github.com/tesseract-ocr/tesseract

#install oracle jdk6
# http://fosshelp.blogspot.com/2013/10/how-to-install-oracle-java-jdk-6-in.html

#apt-add-repository -y ppa:fkrull/deadsnakes
#apt-get update -y
#apt-get install -y python2.5

##rm /usr/bin/python
##ln -s /usr/bin/python2.5 /usr/bin/python

# set up environment for development with scapy
echo "1"
yes | unzip /vagrant/scapy-2.3.1.zip -d /vagrant
echo "2"
sudo python /vagrant/scapy-2.3.1/setup.py install
echo "3"

#unverified
git clone https://github.com/jayrambhia/Install-OpenCV.git
##few bash steps here
