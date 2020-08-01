#!/bin/sh
numlockx on &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh) &
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
