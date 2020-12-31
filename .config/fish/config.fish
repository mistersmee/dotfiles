set fish_greeting
starship init fish | source
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
