#!/bin/bash

net_ease_music_url="https://d1.music.126.net/dmusic/netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb"

wget ${net_ease_music_url} -O /tmp/netease_install.deb -c

sudo dpkg -i /tmp/netease_install.deb
