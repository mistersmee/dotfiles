#!/bin/sh
numlockx on &
xset r rate 300 50
xmodmap -e "clear Lock"
xmodmap -e "keysym Caps_Lock = Escape"
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
if [ -d /etc/X11/xinit/xinitrc.d ];
then for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
    done
    unset f
fi
exec i3
