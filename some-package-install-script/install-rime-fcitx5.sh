#!/bin/bash
sudo apt install fcitx5
sudo apt install fcitx5-rime

commit_id=a33bd8d

mkdir -p /tmp/rime/
cd /tmp/rime/

git clone https://github.com/Sologala/rime-ice.git

sudo cp -rf ./rime-ice/* /usr/share/rime-data/


