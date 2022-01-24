
# copy and convert config file 

# 1. i3 config 
mkdir ~/.i3
cp ./i3config ~/.i3/config

# 2. alacritty config
cp ./alacritty.yml ~/.config/

# 3. compton config 
cp ./compton.yml ~/.config/

# 4. wallpapers
mkdir ~/Pictures
cp -r ./feh_wallpapers ~/Pictures/

# 5. copy Xmodmap key remapping configruation
cp ./Xmodmap ~/.Xmodmap

# 6. evdev ???
sduo cp ./evdev /usr/share/X11/xkb/keycodes/


