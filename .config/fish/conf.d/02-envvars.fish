# declaring defaults

set -gx EDITOR "nvim"
set -gx STATUSBAR "waybar"
set -gx VIDEO "mpv"
set -gx IMAGE "feh"
set -gx COLORTERM "truecolor"
set -gx PAGER "less"
set -gx WM "Hyprland"
set -gx OPENER "mimeo"
set -gx VISUAL "nvim"
set -gx READER "zathura"
set -gx TERMINAL "kitty"
set -gx BROWSER "firefox"
set -gx DIFFPROG "nvim -d"

# Adds `~/.local/bin` to $PATH

set -gx PATH "/usr/local/bin:$HOME/.local/bin:/usr/bin/vendor_perl:$PATH"

# ~/ Clean-up:

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx NOTMUCH_CONFIG ""$XDG_CONFIG_HOME"/notmuch/notmuchrc"
set -gx NPM_CONFIG_USERCONFIG ""$XDG_CONFIG_HOME"/npm/npmrc"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XINITRC ""$XDG_CONFIG_HOME"/X11/xinitrc"
set -gx GTK2_RC_FILES ""$XDG_CONFIG_HOME"/gtk-2.0/gtkrc"
set -gx GOPATH ""$XDG_DATA_HOME"/go"
set -gx CARGO_HOME ""$XDG_DATA_HOME"/cargo"
set -gx PASSWORD_STORE_DIR ""$XDG_DATA_HOME"/pass"
set -gx TERMINFO ""$XDG_DATA_HOME"/terminfo"
set -gx TERMINFO_DIRS ""$XDG_DATA_HOME"/terminfo:/usr/share/terminfo"
set -gx XAUTHORITY ""$XDG_RUNTIME_DIR"/Xauthority"
set -gx GRADLE_USER_HOME ""$XDG_DATA_HOME"/gradle"
set -gx WEECHAT_HOME ""$XDG_CONFIG_HOME"/weechat"
set -gx ANDROID_HOME ""$XDG_DATA_HOME"/android"
set -gx ADB_VENDOR_KEYS ""$XDG_DATA_HOME"/android/adbkey"
set -gx PYTHONSTARTUP ""$XDG_CONFIG_HOME"/python/pythonrc"
#set -gx GNUPGHOME ""$XDG_DATA_HOME"/gnupg"
set -gx WINEPREFIX ""$XDG_DATA_HOME"/wine"
set -gx JUPYTER_PLATFORM_DIRS ""$XDG_CONFIG_HOME"/jupyter"
set -gx W3M_DIR "$XDG_STATE_HOME/w3m"
set -gx PARALLEL_HOME ""$XDG_CONFIG_HOME"/parallel"
set -gx KERAS_HOME ""$XDG_CONFIG_HOME"/keras"
set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
set -gx  RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -gx REPO_CONFIG_DIR "$XDG_CONFIG_HOME"

#other miscellaneous programs

set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 40%"
set -gx ASAN_OPTIONS "log_path=asan.log"

# QT Config

#set -gx QT_STYLE_OVERRIDE "kvantum"
set -gx QT_QPA_PLATFORMTHEME "qt5ct"

#less config

set -gx LESSHISTFILE "-"

# colored man pages

set -gx LESS_TERMCAP_md \e'[01;31m'
set -gx LESS_TERMCAP_me \e'[0m'
set -gx LESS_TERMCAP_se \e'[0m'
set -gx LESS_TERMCAP_so \e'[01;44;33m'
set -gx LESS_TERMCAP_ue \e'[0m'
set -gx LESS_TERMCAP_us \e'[01;32m'

#nnn

set -gx NNN_FIFO "/tmp/nnn.fifo"
set -gx NNN_HELP "fortune"
set -gx NNN_PLUG 'p:preview-tui;x:!chmod +x $nnn'
#set -gx NNN_OPENER "swallow xdg-open"
set -gx NNN_OPENER "xdg-open"
set -gx NNN_BMS "g:~/dl/git/;d:~/dl/;m:~/mus/;s:~/.local/share/stuff;r:~/.local/share/rtorrent;h:~/.local/share/mount;o:~/docs/"
set -gx NNN_ARCHIVE "\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)"
set -gx NNN_COLORS '1234'
set -gx NNN_FCOLORS 'c1e2272e006033f7c6d6abc4'
set -gx LANG en_IN.UTF-8

# IBus support

set -gx GTK_IM_MODULE ibus
set -gx GLFW_IM_MODULE ibus
set -gx QT_IM_MODULE ibus
set -gx XMODIFIERS @im=ibus

# Wayland

set -gx BEMENU_OPTS "--fn 'Fira Code 15'"
set -gx SDL_VIDEODRIVER "wayland,x11"
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx XDG_CURRENT_DESKTOP sway
set -gx XDG_SESSION_TYPE wayland
set -gx XDG_SESSION_DESKTOP sway
set -gx QT_QPA_PLATFORM "wayland;xcb"
set -gx GDK_BACKEND "wayland,x11"
set -gx MOZ_ENABLE_WAYLAND 1

# ssh agent

set -gx SSH_AGENT_PID ""
set -gx SSH_AUTH_SOCK $(gpgconf --list-dirs agent-ssh-socket)

set -gx GPG_TTY $(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

#autostart WM on tty1

#if status is-login
#    if test -z "$DISPLAY" -a "$(tty)" = /dev/tty1
#        exec sx ~/.config/sx/sxrc 2> /tmp/X.log
#    end
#end

if status is-login
    if test -z "$DISPLAY" -a "$(tty)" = /dev/tty1
        exec Hyprland > /tmp/X.log 2>&1
    end
end
