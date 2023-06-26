set fish_greeting

source $HOME/.config/fish/abbreviations.fish
source $HOME/.config/fish/envvars.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$(tty)" = /dev/tty1
        exec Hyprland > /tmp/X.log 2>&1
    end
end

starship init fish | source
