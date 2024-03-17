#!/bin/bash

source $(pwd)/utils/github.sh


version=6.0.35
cd tmp/zetero_temp
wget -cO /tmp/zotero_install.tar.bz2 https://download.zotero.org/client/release/${version}/Zotero-${version}_linux-x86_64.tar.bz2

if [[ $? -ne 0 ]]; then
    echo download faild
    exit 1
fi

sudo unar -f -d /tmp/zotero_install.tar.bz2 -o /tmp/zotero/
sudo mv /tmp/zotero/zotero_install/Zotero_linux-x86_64/ /opt/zotero
cd /opt/zotero
./set_launcher_icon
echo hhh
rm ${HOME}/.local/share/applications/zetero.desktop
# rm $(pwd)/zotero.desktop
sudo ln -s $(pwd)/zotero.desktop ${HOME}/.local/share/applications/zetero.desktop


