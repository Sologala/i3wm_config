

function is_link(){	
	if [ ! -L $1 ]; then
		return 0
	fi
	return 1
}
function is_file_exist(){
	echo $1
	if [ ! -f $1 ]; then
		return 0
	fi
	return 1
}
function is_path_exist(){
	if [ ! -d $1 ]; then
		return 0
	fi
	return 1
}
function copy_and_backup(){
	dir_name=$(dirname $2)
	file_name=$(basename $2)
	echo dir: $dir_name
	echo file: $file_name
	
	if [ ! -p $dir ] ; then
		echo "Creating "$dir
		mkdir -p $dir
	fi

	if [ -f $2 ] ;then 
		if [ ! -L $2 ] ; then
			echo "File" $2 "alread exist"
			echo "back up with$2.bck"
			mv $2 $2.bck
		fi	
	fi
	echo Link $1 to $2
	ln -s $1 $2
}

# 1. i3 config 
copy_and_backup "$(pwd)/i3config" "${HOME}/.config/i3/config"
# 2. alacritty config
copy_and_backup "$(pwd)/alacritty.yml" "${HOME}/.config/alacritty.yml"
# 3. compton config 
copy_and_backup "$(pwd)/compton.conf" "${HOME}/.config/compton.conf"
# 4. Xmodmap
copy_and_backup "$(pwd)/Xmodmap" "${HOME}/.Xmodmap"


# 4. wallpapers
mkdir ~/Pictures
cp -r ./feh_wallpapers ~/Pictures/

# 5. polybar
copy_and_backup "$(pwd)/polybar/config.ini" "${HOME}/.config/polybar/mypolybar.ini"
copy_and_backup "$(pwd)/polybar/launch.sh" "${HOME}/.config/polybar/launch.sh"

# 6. evdev ???
sudo cp ./evdev /usr/share/X11/xkb/keycodes/
