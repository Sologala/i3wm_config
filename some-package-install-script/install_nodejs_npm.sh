node_version=$1
curl -sL https://deb.nodesource.com/setup_${node_version}.x | sudo -E bash -
sudo apt-get install nodejs -y

