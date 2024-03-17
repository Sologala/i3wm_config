#!/bin/bash
source $(pwd)/utils/github.sh

github_user_name=obsidianmd
github_repo_name=obsidian-releases
echo query tag version from  https://github.com/${github_user_name}/${github_repo_name}
tag=$(lastrelease ${github_user_name}/${github_repo_name})
echo the queried tag is ${tag}
no_v_tag=$(remove_tag_v ${tag})
# https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz


github_file_format=obsidian_${no_v_tag}_amd64.deb

wget -c https://github.com/${github_user_name}/${github_repo_name}/releases/download/${tag}/${github_file_format} -P /tmp/
sudo dpkg -i /tmp/${github_file_format}

