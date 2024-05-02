wget -c -O /tmp/ros2-humble.tar.bz2 https://github.com/ros2/ros2/releases/download/release-humble-20240222/ros2-humble-20240222-linux-jammy-amd64.tar.bz2

sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl -y

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

mkdir -p ~/ros2_humble
cd ~/ros2_humble
tar xf /tmp/ros2-humble.tar.bz2


sudo apt update
sudo apt install -y python3-rosdep
sudo rosdep init
rosdep update

sudo apt upgrade
rosdep install --from-paths ~/ros2_humble/ros2-linux/share --ignore-src -y --skip-keys "cyclonedds fastcdr fastrtps rti-connext-dds-6.0.1 urdfdom_headers"
sudo apt install ros-dev-tools
