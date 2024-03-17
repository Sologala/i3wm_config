
#!/bin/bash

source "$(pwd)/utils/github.sh"

user_name=wez
repo_name=wezterm
tag=$(lastrelease ${user_name}/${repo_name})
echo the queried tag is ${tag}
res_tag=${tag}
github_file=wezterm-${tag}.Ubuntu22.04.deb

download_from_github ${user_name} ${repo_name} ${tag} ${github_file}

if [[ $? -ne 0 ]]; then
    echo "download faild"
    exit 1
fi

sudo dpkg -i /tmp/${repo_name}_temp/${github_file}
