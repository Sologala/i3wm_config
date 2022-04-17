mkdir -p /tmp/opencv_build

cd /tmp/opencv_build
git clone https://github.com/opencv/opencv.git 
cd opencv
git checkout 4.5.4
cd ..


git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 4.5.4

cd ..
echo "clone done ~"

#  start build 
cd opencv
mkdir build 
cd build 
cmake  .. -DCMAKE_BUILD_TYPE=Release -DOPENCV_EXTRA_MODULES_PATH="../../opencv_contrib/modules"
make -j3
sudo make install


