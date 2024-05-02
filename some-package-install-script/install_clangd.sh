sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh) $1" 


yes | sudo -E apt install clangd
