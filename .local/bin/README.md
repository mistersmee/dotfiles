# Various useful scripts written by me or lifted from someone else ;).

## achroot

Script that puts all commands to build Arch packages in a chroot into a single script. Use by cd-ing into directory containing PKGBUILD and run achroot.

## autostart

Script that starts all the programs I need while running X. It is called by dwm while starting up. It is a much more elegant solution than the autostart patches in dwm.

## autostart-wlnd

Same basic idea as the autostart script, just for wayland compositors and programs.

## bright

Christopher Peterson's backlight brightness script using /sys/class/backlight. Much better solution than using xrandr. Also, works with Benedikt Vollmerhaus's brightness_notify.py script.

## brightness_notify.py & battery_notify.py

Benedikt Vollmerhaus's scripts to notify if backlight changes, and if battery goes beneath a certain level.

## build

Script to automatically build TWRP for my device, cebu. This came about mainly due to fish, and it's incompatibility with build/envsetup.sh which we source first before building.

## compiler

Luke Smith's script to compile stuff. Called by a keybind in vim currently, just like his setup, though can be used elsewhere.

## dmenumount & dmenuumount

Luke Smith's scripts to mount/unmount both USB and Android devices.

## dmenuunicode

Luke Smith's script for inserting emojis in st.

## fehbg

Script that set's the wallpaper using feh.

## ferdium

Wrapper script to start ferdium with electron flags that enable running ferdium on Wayland natively. (Ferdium doesn't respect electron-flags.conf, so this hacky solution ftw)

## ffprof

Script to choose firefox profiles: haxxor: for hardened firefox with arkenfox user.js et al, and normie: for normal firefox

## import-gsettings

Script to import GTK settings for sway, see (https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland) for more.

## monctrl

Script to control monitors of my laptop: the options are to 1) duplicate my laptop's screen and the external (HDMI) screen, 2) output only external screen 3) output only laptop screen.
This script assumes that I'm plugging in using HDMI not DP-over-USB-C and the external screen is 1920x1080.

## monctrlwlnd

Script to control monitors of my laptop on wayland, specifically, sway. The script is basically same as the X script, monctrl, except for option 1, duplicate screen, which is missing, because sway, or wayland doesn't have a way to mirror or duplicate screens yet.

## opout

Luke Smith's script to open the output file, typically the pdf output from latex files. Called by a keybind in nvim, just like his setup.

## shutdmenu

Script to create a shutdown menu using dmenu.

Options are: logout, restart X, reload sxhkd, shutdown, reboot and lock X.

## texclear

Luke Smith's script to clear the Tex build files. Called in the config file in nvim, just like his setup.


## tnot

Script that hooks into my rtorrent config to notify when a torrent has finished downloading.
