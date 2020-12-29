
# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:options' list-colors '=^(-- *)=34'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'

# cd without cd
setopt correct
setopt  auto_cd

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)		# Include hidden files.


# plugins 
source ~/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search.zsh 

 export LANG=en_US.UTF-8

# aliases
alias vim="vim -i NONE"
alias w="nv ~/vimwiki/index.wiki"
alias wget="wget --hsts-file="$XDG_CACHE_HOME/wget-hsts" "
alias vc="sudo cryptsetup --type tcrypt --veracrypt --tcrypt-hidden "
alias bconf="nv ~/.config/bspwm/bspwmrc"
alias sconf="nv ~/.config/sxhkd/sxhkdrc"
alias grep="grep --color=always"
alias zconf="nvim ~/.zshrc"
alias ls='ls-icons -lh --color=auto'
alias i3conf="nv ~/.config/i3/config"
alias pconf="nv ~/.config/polybar/config"
alias nconf="nv ~/.config/nvim/init.vim"
alias nb="newsboat"
alias cp="/usr/bin/advcp -gv"
alias mbsync="mbsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc"
alias mv="/usr/bin/advmv -gv"
alias nm="neomutt"
alias pb="podboat"
alias wt="curl wttr.in/kolhapur"
alias nv="nvim"
alias ra="ranger"
alias rv="ttrv"
alias nvconf="nv ~/.config/nvim/init.vim"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias cal="calcurse -a |xargs -0 notify-send "Appointments.";calcurse -t | xargs -0 notify-send "Todo";calcurse"
alias nc="ncmpcpp"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
         NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    #export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -drF "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_JOBS_SHOW=true

# Spaceship Prompt
function zle-keymap-select() {
   zle reset-prompt zle -R
}
zle -N zle-keymap-select


autoload -U colors && colors
function vi_mode_prompt_info() {echo "%{$fg[red]%}${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%/(visual|viopp)/[% VISUAL]%}" }

RPS1='%t $(vi_mode_prompt_info)'
RPS2=$RPS1
autoload -U promptinit; promptinit
prompt spaceship

# autosuggestions config

ZSH_AUTOSUGGEST_STRATEGY=(completion history match_prev_cmd)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
