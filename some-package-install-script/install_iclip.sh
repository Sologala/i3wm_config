source $(pwd)/utils/github.sh

github_user_name=Sologala
github_repo_name=iClipboard
echo query tag version from  https://github.com/${github_user_name}/${github_repo_name}
tag=$(lastrelease ${github_user_name}/${github_repo_name})
echo the queried tag is ${tag}
res_tag=$(remove_tag_v ${tag})


github_file_format=iClipboard_Linux_x86_64.tar.gz
echo $github_file_format

mkdir -p ~/.config/bin
wget -c https://github.com/${github_user_name}/${github_repo_name}/releases/download/${tag}/${github_file_format} -P /tmp/
rm -rf /tmp/${github_repo_name}_temp/
unar /tmp/${github_file_format} -D -o /tmp/${github_repo_name}_temp
cp /tmp/${github_repo_name}_temp/iClipboard ~/.local/bin/

sudo apt install -y libx11-dev xvfb
