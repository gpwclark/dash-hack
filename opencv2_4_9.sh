# Courtesy of https://github.com/jayrambhia/Install-OpenCV
arch=$(uname -m)
if [ "$arch" == "i686" -o "$arch" == "i386" -o "$arch" == "i486" -o "$arch" == "i586" ]; then
flag=1
else
flag=0
fi
echo "unzipping OpenCV 2.4.9"
pwd
cp /vagrant/OpenCV-2.4.9.zip ./
unzip OpenCV-2.4.9.zip
echo "unzipped OpenCV 2.4.9"
cd opencv-2.4.9
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make
sudo make install
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
cd ../../..
rm -rf OpenCV
echo "OpenCV 2.4.9 ready to be used"
