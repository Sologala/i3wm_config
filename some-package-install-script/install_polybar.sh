sudo apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev

mkdir -p build/polybar_build
cd build/polybar_build
if [ ! -d polybar ];then
git clone https://github.com/polybar/polybar.git
fi
cd polybar
git checkout 3.5.0
echo "clone done ~"

./build.sh -f 


