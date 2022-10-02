# declaring defaults

export EDITOR="nvim"
export STATUSBAR="dwmbar"
export VIDEO="mpv"
export IMAGE="sxiv"
export COLORTERM="truecolor"
export PAGER="less"
export WM="dwm"
export OPENER="xdg-open"
export VISUAL="nvim"
export READER="zathura"
export TERMINAL="kitty"
export BROWSER="firefox"
export DIFFPROG="nvim -d"

# Adds `~/.local/bin` to $PATH

export PATH="$HOME/.local/bin:/usr/bin/vendor_perl/:$PATH"

# ~/ Clean-up:

export XDG_CONFIG_HOME="$HOME/.config"
export NOTMUCH_CONFIG=""$XDG_CONFIG_HOME"/notmuch/notmuchrc"
export NPM_CONFIG_USERCONFIG=""$XDG_CONFIG_HOME"/npm/npmrc"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
#export XINITRC=""$XDG_CONFIG_HOME"/X11/xinitrc"
export GTK2_RC_FILES=""$XDG_CONFIG_HOME"/gtk-2.0/gtkrc"
export GOPATH=""$XDG_DATA_HOME"/go"
export CARGO_HOME=""$XDG_DATA_HOME"/cargo"
export PASSWORD_STORE_DIR=""$XDG_DATA_HOME"/pass"
export TERMINFO=""$XDG_DATA_HOME"/terminfo"
export TERMINFO_DIRS=""$XDG_DATA_HOME"/terminfo:/usr/share/terminfo"
#export XAUTHORITY=""$XDG_RUNTIME_DIR"/Xauthority"
export GRADLE_USER_HOME=""$XDG_DATA_HOME"/gradle"
export WEECHAT_HOME=""$XDG_CONFIG_HOME"/weechat"
export ANDROID_HOME=""$XDG_DATA_HOME"/android"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
#export GNUPGHOME=""$XDG_DATA_HOME"/gnupg"

#other miscellaneous programs
#export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

export QT_STYLE_OVERRIDE="kvantum"

#less config

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
export NNN_HELP="fortune"
export NNN_PLUG='p:preview-tui;x:!chmod +x $nnn'
export NNN_OPENER="swallow xdg-open"
export NNN_BMS="g:~/dl/git/;d:~/dl/;m:~/mus/;s:~/.local/share/stuff;r:~/.local/share/rtorrent"
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
export NNN_COLORS='1234'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'


# IBus support

#export GTK_IM_MODULE=ibus
#export GLFW_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus

# Wayland

export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND="wayland,x11"
export MOZ_ENABLE_WAYLAND=1

#autostart WM on tty1

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec sx ~/.config/sx/sxrc 2> /tmp/X.log; fi
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec sway > /tmp/X.log 2>&1; fi
