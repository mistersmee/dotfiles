#!/bin/sh
xset r rate 300 50 &
xmodmap -e "clear Lock" &
xcompmgr &
xmodmap -e "keysym Caps_Lock = Escape" &
xmodmap -e "keysym Menu = Super_R" &
xrdb -merge ~/.Xresources &
exec bspwm
