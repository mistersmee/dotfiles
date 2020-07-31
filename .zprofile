export QT_QPA_PLATFORMTHEME="gtk2"
export EDITOR="nvim"
export VISUAL="nvim"
export READER="zathura"
export TERMINAL="st"
export BROWSER="firefox"

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"



# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"


#other programs
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

#less variables
export LESSHISTFILE="-"
export LESS_TERMCAP_mb="$(printf '%b' 'm')"
export LESS_TERMCAP_md="$(printf '%b' 'm')"
export LESS_TERMCAP_me="$(printf '%b' '')"
export LESS_TERMCAP_so="$(printf '%b' ';44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '')"
export LESS_TERMCAP_us="$(printf '%b' 'm')"
export LESS_TERMCAP_ue="$(printf '%b' '')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"


if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
