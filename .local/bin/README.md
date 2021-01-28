# Various useful scripts written by me or lifted from someone else ;).

# bspwmlayout 

Script using dmenu to select bspwm's automatic window positioning scheme.
Choices between: longest side, alternate, spiral.

# calnotify

Script to notify appointments and todo of calcurse.
Used as a cronjob to run periodically every 15 minutes.

# colch

Script to change colourscheme and overall aesthetic of my system between Solarized, Nord and Gruvbox. 

Note to self: requires files in specific places and specific programs. Ought to work OotB with dotfiles.

# crystal 

[crystal](https://github.com/salman-abedin/crystal) is a script that allows for smooth fullscreening of transparent windows. It minimises other windows and the status bar, so they don't appear behind the transparent window. Needed, AFAIK, only in  bspwm.

# dmenuunicode

Luke Smith's script for inserting emojis in st.


# dmtpfs

Brodie Robertson's Android automount script.

# i3exit

Script to send notification and shutdown i3. (Deprecated in favour of shutdmenu).

# i3weather

Brodie Robertson's script for weather output. Used in Polybar.

# img

Luke Smith's deprecated script to display images in the terminal using Ueberzug linbrary. Used only for a video, AFAIK, deprecated in favour of better solutions. I don't use it either, it takes way too long to display it on my system.

# mailsync

Script created my me, and partly inspired by Luke Smith's script of the same name.
Syncs my email, sends a notification telling how many new emails, as well as who they are from, and the subject.

# scratch

Script to imitate i3's scratchpad feature in bspwm. Used to hold my music player in the scratchpad.

# shutdmenu

Script to create a shutdown menu using dmenu. 
Options are: logout, restart X, reload sxhkd, shutdown, reboot and lock X.

# st-copyout
# st-urlhandler

Luke Smith's scripts for st, modified to work with my build of dmenu, which allow to copy and follow urls as well as output of commands in st. Should work in other terminals as well.

# termpv
# tmpv
# ytmpv

Scripts to play files in mpv, (ytmpv for youtube videos) required due to special requirements of mpv for the Raspberry Pi. (this version of mpv's --vo=rpi is the only usable hardware accelerated output, but cannot be controlled except in the terminal.)

