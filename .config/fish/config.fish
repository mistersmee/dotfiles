##environmental variables

## declaring defaults
set EDITOR "nvim"
set STATUSBAR "polybar"
set VIDEO "mpv"
set IMAGE "feh"
set COLORTERM "truecolor"
set PAGER "less"
set WM "bspwm"
set OPENER "xdg-open"
set VISUAL "nvim"
set READER "zathura"
set TERMINAL "st"
set BROWSER "firefox"

## Adds `~/.local/bin` to $PATH
set PATH "$PATH:$HOME/.local/bin"

## ssh agent
set SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

## ~/ Clean-up:
set XDG_CONFIG_HOME "$HOME/.config"
set NOTMUCH_CONFIG ""$XDG_CONFIG_HOME"/notmuch/notmuchrc"
set NPM_CONFIG_USERCONFIG ""$XDG_CONFIG_HOME"/npm/npmrc"
set XDG_DATA_HOME "$HOME/.local/share"
set XDG_CACHE_HOME "$HOME/.cache"
set XINITRC ""$XDG_CONFIG_HOME"/X11/xinitrc"
set GTK2_RC_FILES ""$XDG_CONFIG_HOME"/gtk-2.0/gtkrc"
set GOPATH ""$XDG_DATA_HOME"/go"
set CARGO_HOME ""$XDG_DATA_HOME"/cargo"
set PASSWORD_STORE_DIR ""$XDG_DATA_HOME"/pass"
set TERMINFO ""$XDG_DATA_HOME"/terminfo"
set TERMINFO_DIRS ""$XDG_DATA_HOME"/terminfo:/usr/share/terminfo"
set XAUTHORITY ""$XDG_RUNTIME_DIR"/Xauthority"

##other miscellaneous programs
set FZF_DEFAULT_OPTS "--layout=reverse --height 40%"
set QT_STYLE_OVERRIDE "kvantum"

##less config
set LESSHISTFILE "-"

## colored man pages

set LESS_TERMCAP_md '\e[01;31m'
set LESS_TERMCAP_me '\e[0m'
set LESS_TERMCAP_se '\e[0m' 
set LESS_TERMCAP_so '\e[01;44;33m' 
set LESS_TERMCAP_ue '\e[0m' 
set LESS_TERMCAP_us '\e[01;32m' 

##nnn

set NNN_FIFO "/tmp/nnn.fifo"
set NNN_PLUG "p:preview-tabbed;x:_chmod +x $nnn"
set NNN_OPENER "xdg-open"
set NNN_BMS "g:~/Downloads/Git/;d:~/Downloads;m:~/Music/"
set NNN_ARCHIVE "\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)"
set NNN_COLORS '1234'
set NNN_FCOLORS 'c1e2272e006033f7c6d6abc4'

##autostart X on tty1
#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; end

# disabling fish greeting
set fish_greeting

# prompt
starship init fish | source

# abbreviations
abbr -a nv "nvim"
abbr -a bc "nvim ~/.config/bspwm/bspwmrc"
abbr -a sc "nvim ~/.config/sxhkd/sxhkdrc"
abbr -a pc "nvim ~/.config/polybar/config"
abbr -a nc "nvim ~/.config/nvim/init.vim"
abbr -a zc "nvim ~/.zshrc"
abbr -a np "ncmpcpp"
abbr -a rt "rtorrent"
abbr -a vc "sudo cryptsetup --type tcrypt --veracrypt --tcrypt-hidden "
abbr -a ls 'lsd '
abbr -a nb "newsboat"
abbr -a d "/usr/bin/git --git-dir $HOME/.dotfiles.git/ --work-tree $HOME"
abbr -a nm "neomutt"
abbr -a pb "podboat"

# functions

function vim
				vim -i NONE
end
function wget
				wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"
end
function grep
				grep --color=always
end
function cp
				/usr/bin/advcp -gv
end
function mbsync
				mbsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc
end
function mv 
				/usr/bin/advmv -gv
end
