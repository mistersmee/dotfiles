#!/bin/sh
xset r rate 300 50
sudo thinkpoint & 
clipmenud &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
xmodmap -e "clear Lock"
xcompmgr &
xmodmap -e "keysym Caps_Lock = Escape"
xmodmap -e "keysym Menu = Super_R"
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
if [ -d /etc/X11/xinit/xinitrc.d ];
then for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
    done
    unset f
fi
exec bspwm
