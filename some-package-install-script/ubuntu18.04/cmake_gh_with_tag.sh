cmake_tag=$1

source ../utils/github.sh
sudo apt remove --purge --auto-remove cmake

download_from_github Kitware CMake v${cmake_tag} cmake-${cmake_tag}-linux-x86_64.tar.gz

unar /tmp/CMake_temp/cmake-${cmake_tag}-linux-x86_64.tar.gz -o ${HOME}/.local/my_install/cmake

sudo ln -sf ${HOME}/.local/my_install/cmake/cmake-${cmake_tag}-linux-x86_64/bin/* /usr/local/bin/

