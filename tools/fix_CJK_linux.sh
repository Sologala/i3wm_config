
file='/etc/fonts/conf.d/64-language-selector-prefer.conf'
# file='/mnt/HOME/wen/repo/i3wm_config/tools/64-language-selector-prefer.conf'
function swap_lines() {
    line1=$1
    line2=$2
    if [ -f "$file" ]; then
        # sed -i '$1{h;d}; $2{x;p;x}' "$file"
        sed -i "${1}{h;d}; ${2}{p;g}" "$file"
    else
        echo "File $file does not exist."
    fi
}

# 使用示例
swap_lines 7 9
swap_lines 18 20
swap_lines 28 30

# cat "$file"
cat "output.txt"
