# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

if test -n "${DISPLAY}"
then
    XAUTHORITY=`LANG=C xauth info | awk '{ print $NF; exit; }'`
    export XAUTHORITY
fi
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

set LST_CONDA_ENV_NAME=

if [ -n "$CONDA_DEFAULT_ENV" ]; then
    # echo "conda has been activated : $CONDA_DEFAULT_ENV"
    if [ "$CONDA_DEFAULT_ENV" != "base" ]; then
        LST_CONDA_ENV_NAME=$CONDA_DEFAULT_ENV
    fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/wen/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/wen/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/wen/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/wen/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [ -n "LST_CONDA_ENV_NAME" ]; then
    conda activate $LST_CONDA_ENV_NAME
fi


#
set proxy_ip='127.0.0.1'
set https_port='20172'
set http_port='20171'
set sock_port='20170'
# export https_proxy=http://127.0.0.1:20172;export http_proxy=http://127.0.0.1:20171;export all_proxy=socks5://127.0.0.1:20170
# export DISPLAY=127.0.0.1:10.0
export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:7890
# export https_proxy=http://192.168.1.14:49191;export http_proxy=http://192.168.1.14:49191;export all_proxy=socks5://192.168.1.14:49191
export MESA_GL_VERSION_OVERRIDE=3.3
alias rr=ranger
alias lg=lazygit

alias wezterm='flatpak run org.wezfurlong.wezterm'
export PATH=${PATH}:${HOME}/.local/bin

# export GOROOT=/opt/go
# export PATH=$GOROOT/bin:$PATH
# # export GOPATH=$HOME/repo/clipboard-online/temp/
# # set GO111MODULE=‘off’

export PATH=$PATH:/usr/local/go/bin 
export PATH=$PATH:~/.cargo/bin/ 
alias ros1="source /opt/ros/noetic/setup.zsh"

alias ca="conda activate"
alias dca="conda deactivate"

alias lg="lazygit"

alias cb="catkin build -DCMAKE_EXPORT_COMPILE_COMMANDS=on"
alias jqm="jq -s 'map(.[])' build/**/compile_commands.json > compile_commands.json"
alias ssros="source ./devel/setup.zsh"
alias ipy='ipython'
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx

export PATH=$PATH:/usr/local/cuda-12.3/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-12.3/lib64/
export CUDA_HOME=$CUDA_HOME:/usr/local/cuda-12.3

# wine env
export WINEARCH=win32
# export WINEPREFIX=/home/wen/Wine/WeChat
#

