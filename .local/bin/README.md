# Various useful scripts written by me or lifted from someone else ;).

## autostart

Script that starts all the programs I need while running X. It is called by dwm while starting up. It is a much more elegant solution than the autostart patches in dwm.

## bright

Christopher Peterson's backlight brightness script using /sys/class/backlight. Much better solution than using xrandr. Also, works with Benedikt Vollmerhaus's brightness_notify.py script.

## brightness_notify.py

Benedikt Vollmerhaus's script to notify if backlight changes.

## dmenumount & dmenuumount

Luke Smith's scripts to mount/unmount both USB and Android devices.

## dmenuunicode

Luke Smith's script for inserting emojis in st.

## fehbg

Script that set's the wallpaper using feh.

## ffprof

Script to choose firefox profiles: haxxor: for hardened firefox with arkenfox user.js et al, and normie: for normal firefox

## monctrl

Script to control monitors of my laptop: the options are to 1) duplicate my laptop's screen and the external (HDMI) screen, 2) output only external screen 3) output only laptop screen.
This script assumes that I'm plugging in using HDMI not DP-over-USB-C and the external screen is 1920x1080.

## shutdmenu

Script to create a shutdown menu using dmenu.

Options are: logout, restart X, reload sxhkd, shutdown, reboot and lock X.

## tnot

Script that hooks into my rtorrent config to notify when a torrent has finished downloading.
