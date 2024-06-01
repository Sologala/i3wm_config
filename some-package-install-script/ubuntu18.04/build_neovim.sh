git clone https://github.com/neovim/neovim.git ./build/neovim
cd ./build/neovim
git checkout v0.10.0
sudo apt-get install ninja-build gettext unzip curl build-essential
rm -rf build
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/my_install/neovim"
make install
ln -s ${HOME}/.local/my_install/neovim/bin/* ${HOME}/.local/bin/
