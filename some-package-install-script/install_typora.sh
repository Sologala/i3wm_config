##########################################################################
# File Name: install_typora.sh
# Author: Dawson wen
# mail: dawsonwen123@gmail.com
# Created Time: 2022年05月12日 星期四 23时46分21秒
#########################################################################
#!/bin/bash

mkdir -p build/build_typora
cd build/build_typora
wget -O typora_free.zip -c https://github.com/ydsuper/Typora_Free_Download/raw/main/The-Installation-Package/typora_0.11.18_linux\(x64\).zip
unzip "typora_free.zip"

sudo dpkg -i *.deb