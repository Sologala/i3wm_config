#!/bin/bash


function __lastrelease() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

function lastrelease(){
    tag=$(__lastrelease $1)
    echo ${tag}
}

function remove_tag_v(){
    if [[ $1 == v* ]]; then
        echo ${1#v}
    else
        echo $1
    fi
}
function download_from_github(){
    user_name=$1
    repo_name=$2
    tag_name=$3
    file_name=$4
    wget -c https://github.com/${user_name}/${repo_name}/releases/download/${tag_name}/${file_name} -P /tmp/${repo_name}_temp
    return $?
}

