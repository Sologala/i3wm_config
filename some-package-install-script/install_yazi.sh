version=$1

if [[ -z "$version" ]]; then
    version=v0.3.3
fi

mkdir -p ./build/
git clone -b $version https://github.com/sxyazi/yazi.git  ./build/yazi
cd ./build/yazi

function isCmdExist() {
	local cmd="$1"
    if [ -z "$cmd" ]; then
		echo "Usage isCmdExist yourCmd"
		return 1
	fi

	which "$cmd" >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		return 0
	fi

	return 2
}

isCmdExist cargo

if (( $? == 2 )); then
    echo "Installing cargo " 
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup update
fi

cargo install --locked yazi-fm yazi-cli
