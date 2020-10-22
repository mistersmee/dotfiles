export EDITOR="nvim"
export STATUSBAR="polybar"
export VIDEO="mpv"
export IMAGE="feh"
export COLORTERM="truecolor"
export PAGER="less"
export WM="bspwm"
export OPENER="xdg-open"
export VISUAL="nvim"
export READER="zathura"
export TERMINAL="st"
export BROWSER="firefox"

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"


#other programs
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export QT_STYLE_OVERRIDE="kvantum"
#less variables
export LESSHISTFILE="-"

# colored man pages

export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m' 
export LESS_TERMCAP_so=$'\e[01;44;33m' 
export LESS_TERMCAP_ue=$'\e[0m' 
export LESS_TERMCAP_us=$'\e[01;32m' 
#nnn
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_OPENER="xdg-open"
export NNN_PLUG="p:preview-tui"
export NNN_BMS="g:~/Downloads/Git/;d:~/Downloads;m:~/Music/"
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_COLORS='12345678'

#autostart X on tty1
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
