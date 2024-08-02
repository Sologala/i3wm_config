
version=$1

if  [ ! -n "$version" ] ;then
    echo "No input version, use default 4.5.4"
    version="4.5.4"
else
    echo "The Version to be install is  $version"
fi

mkdir -p build/opencv_build/$version

cd build/opencv_build/$version
if [ ! -d opencv ];then
git clone https://github.com/opencv/opencv.git 
fi
cd opencv
git checkout $version
cd ..

if [ ! -d opencv_contrib ];then
git clone https://github.com/opencv/opencv_contrib.git
fi
cd opencv_contrib
git checkout $version

cd ..
echo "clone done ~"

#  start build 
cd opencv
if [ ! -d build ];then 
mkdir build 
fi
cd build 

# cd "../../opencv_contrib/modules"
# echo "$(pwd)"
# ls

cmake  .. -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release\
    -DCMAKE_INSTALL_PREFIX="/opt/opencv/$version"\
    -DOPENCV_ENABLE_NONFREE=1\
    -DOPENCV_EXTRA_MODULES_PATH="../../opencv_contrib/modules"
    
make -j10
sudo make install


