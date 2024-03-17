#!/bin/bash
source $(pwd)/utils/github.sh

github_user_name=jesseduffield
github_repo_name=lazygit
echo query tag version from  https://github.com/${github_user_name}/${github_repo_name}
tag=$(lastrelease ${github_user_name}/${github_repo_name})
echo the queried tag is ${tag}
res_tag=$(remove_tag_v ${tag})
echo remove_v_tag is ${res_tag}

# https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz


github_file_format=lazygit_${res_tag}_Linux_x86_64.tar.gz
echo $github_file_format

wget -c https://github.com/${github_user_name}/${github_repo_name}/releases/download/${tag}/${github_file_format} -P /tmp/ 
rm -rf /tmp/lazygit_temp/
unar /tmp/${github_file_format} -D -o /tmp/lazygit_temp
cp /tmp/lazygit_temp/lazygit ~/.local/bin/

