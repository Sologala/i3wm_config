cur_pwd=$(pwd)
export CMAKE_PREFIX_PATH=${HOME}/.local/my_install

InstallPath=/usr/
git clone https://github.com/KDE/extra-cmake-modules.git ./build/ECM
cd ./build/ECM/
mkdir build
cd build
# cmake ..
cmake -DCMAKE_INSTALL_PREFIX=${InstallPath}  ..
make  -j5
make install

cd ${cur_pwd}

sudo apt install -y libxcb1-dev libxcb-util-dev libxcb-keysyms1-dev

git clone https://github.com/fcitx/xcb-imdkit.git ./build/xcb_imdkit
cd ./build/xcb_imdkit
cmake -DCMAKE_INSTALL_PREFIX=${InstallPath} -DECM_DIR=${HOME}/.local/my_install/share/ECM/cmake/ .
make -j5
sudo make install

cd ${cur_pwd}
git clone https://github.com/fmtlib/fmt.git ./build/fmt
cd ./build/fmt
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${InstallPath} -DFMT_TEST=Off
make -j5 
sudo make install

cd ${cur_pwd}

echo "Read to build fcitx5"
sudo apt-get install -y zlib1g-dev pkg-config libdbus-1-dev libuv1.dev uuid-dev
sudo apt install -y libxcb-xkb-dev libxcb-xfixes0-dev libxcb-icccm4-dev libxcb-xinerama0-dev\
    libxcb-randr0-dev libxcb-ewmh-dev libcairo2-dev\
    libxkbfile-dev libxkbcommon-dev  libxkbfile-dev libxkbcommon-x11-dev\
    libjson-c-dev libenchant-dev libpango1.0-dev libgtk2.0-dev libgdk-pixbuf2.0-dev\
    gcc-9 g++-9
    # libstdc++-10-dev

git clone https://github.com/fcitx/fcitx5.git ./build/fcitx5
cd ./build/fcitx5

cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-8 -DCMAKE_CXX_COMPILER=/usr/bin/g++-8\
    -DENABLE_WAYLAND=Off -DCMAKE_INSTALL_PREFIX=${InstallPath}\
    -DECM_DIR=${HOME}/.local/my_install/share/ECM/cmake/\
    -Dfmt_DIR=${HOME}/.local/my_install/lib/cmake/fmt/\
    -DXCBImdkit_DIR=${HOME}/.local/my_install/lib/cmake/XCBImdkit/\
    .

make -j5
sudo make install


cd ${cur_pwd}

git clone https://github.com/fcitx/fcitx5-qt.git ./build/fcitx5-qt/
cd ./build/fcitx5-qt/
sudo apt install -y  qtbase5-dev qtdeclarative5-dev qtbase5-private-dev

cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-8 -DCMAKE_CXX_COMPILER=/usr/bin/g++-8\
    -DENABLE_QT5=On -DENABLE_QT6=Off -DENABLE_QT4=Off -DENABLE_QT6_WAYLAND_WORKAROUND=Off\
    -DCMAKE_INSTALL_PREFIX=${InstallPath}\
    -DECM_DIR=${HOME}/.local/my_install/share/ECM/cmake/\
    -DFcitx5Utils_DIR=~/.local/my_install/lib/cmake/Fcitx5Utils/\
    .

make -j5
sudo make install

cd ${cur_pwd}

if [ ! -d "${HOME}/.local/my_install/include/boost/" ]; then
    sudo apt-get install -y python-dev
    wget -c https://archives.boost.io/release/1.85.0/source/boost_1_85_0.tar.gz -O ./build/boost_1_85_0.tar.gz
    cd ./build/
    tar -xzf boost_1_85_0.tar.gz
    cd boost_1_85_0
    ./bootstrap.sh --prefix=${HOME}/.local/my_install/
    # ./b2
    ./b2 install
fi




cd ${cur_pwd}
sudo apt install -y libyaml-cpp-dev libleveldb-dev libmarisa-dev libopencc-dev libstdc++-8

git clone https://github.com/rime/librime.git ./build/librime
cd ./build/librime
mkdir build
cd build
cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-8 -DCMAKE_CXX_COMPILER=/usr/bin/g++-8 \
      -DENABLE_LOGGING=Off -DBUILD_TEST=Off\
      -DCMAKE_INSTALL_PREFIX=/usr/ \
      -DCMAKE_CXX_STANDARD_LIBRARIES="-lstdc++fs" \
      ..
make -j10 LDLIBS=-lstdc++fs
sudo make install

cd ${cur_pwd}
git clone https://github.com/fcitx/fcitx5-rime.git  ./build/fcitx5-rime
cd ./build/fcitx5-rime
mkdir build
cd build 

cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-8 -DCMAKE_CXX_COMPILER=/usr/bin/g++-8\
     -DCMAKE_CXX_FLAGS=-isystem\ ${HOME}/.local/my_install/include/ \
     -DCMAKE_SHARED_LINKER_FLAGS="-L/${HOME}/.local/my_install/lib" \
     -DCMAKE_CXX_STANDARD_LIBRARIES="-lrime" \
    -DCMAKE_CXX_STANDARD_LIBRARIES="-lstdc++fs" \
    -DCMAKE_INSTALL_PREFIX=/usr/\
    -DCMAKE_EXPORT_COMPILE_COMMANDS=on ..
make 
sudo make install


cd ${cur_pwd}

git clone https://github.com/fcitx/fcitx5-configtool.git ./build/fcitx5-configtool
cd ./build/fcitx5-configtool

sudo apt install -y libqt5x11extras5-dev  libkf5itemviews-dev  qtquickcontrols2-5-dev libkf5coreaddons-dev libkf5i18n-dev \
    libkf5package-dev   kirigami2-dev

mkdir -p build
cd build
cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-8 -DCMAKE_CXX_COMPILER=/usr/bin/g++-8\
     -DCMAKE_CXX_FLAGS=-isystem\ ${HOME}/.local/my_install/include/ \
     -DCMAKE_SHARED_LINKER_FLAGS="-L/${HOME}/.local/my_install/lib" \
     -DCMAKE_CXX_STANDARD_LIBRARIES="-lrime" \
    -DCMAKE_CXX_STANDARD_LIBRARIES="-lstdc++fs" \
    -DUSE_QT6=Off\
    -DCMAKE_EXPORT_COMPILE_COMMANDS=on\
    ..
make -j10
sudo make install



# git clone https://github.com/fcitx/fcitx5-gtk.git ./build/fcitx5-gtk
# sudo apt install -y libgirepository1.0-dev libgtk2.0-dev libgtk-3-dev
# cd ./build/fcitx5-gtk
# cmake -DENABLE_GTK4_IM_MODULE=Off -DCMAKE_INSTALL_PREFIX=${HOME}/.local/my_install
# make
# make install






