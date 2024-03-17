#!/bin/bash


source "$(pwd)/utils/github.sh"

user_name=web1n
repo_name=wechat-universal-flatpak
tag=$(lastrelease ${user_name}/${repo_name})
echo the queried tag is ${tag}
res_tag=${tag}
github_file=com.tencent.WeChat.flatpak
sudo wget -c https://github.com/web1n/wechat-universal-flatpak/releases/download/2403140839/com.tencent.WeChat.flatpak /tmp/wechat.flatpak

sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

download_from_github ${user_name} ${repo_name} ${tag} ${github_file}

if [[ $? -ne 0 ]]; then
    echo "download faild"
    exit 1
fi

flatpak install /tmp/${repo_name}_temp/${github_file}
