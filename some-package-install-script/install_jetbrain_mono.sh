wget -c https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip -O /tmp/JetBrainsMono.zip

mkdir -p  /usr/share/fonts/JetBrainsMono

sudo unzip /tmp/JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMono
cd /usr/share/fonts/JetBrainsMono

mkfontscale
mkfontdir

mkdir -p /usr/share/fonts/yahei
wget -c https://github.com/Sologala/i3wm_config/blob/master/chinese.msyh.ttf -O /usr/share/fonts/yahei/chinese.msyh.ttf

cd /usr/share/fonts/yahei
mkfontscale
mkfontdir




