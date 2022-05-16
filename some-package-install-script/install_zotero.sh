mkdir -p build/zetero_buld

cd build/zetero_build
wget -O zotero_install.tar.bz2 https://download.zotero.org/client/release/6.0.4/Zotero-6.0.4_linux-x86_64.tar.bz2

unar zotero_install.tar.bz2
sudo mv Zotero_linux-x86_64 /opt/zotero
cd /opt/zotero
./set_launcher_icon
ln -s $(pwd)/zotero.desktop ~/.local/share/applications/zetero.desktop


