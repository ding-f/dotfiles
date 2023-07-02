# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export STARSHIP_CONFIG=$HOME/.config/starship.toml
export SCRIPTDIR=$HOME/.local/share/scriptdeps
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin

alias ls='lsd -l'
alias la='lsd -al'
alias ..='cd ..'
alias ...='cd ../..'
alias vifm='vifmrun'
alias vim='nvim'
alias svim='sudo nvim'
alias chmod='sudo chmod'
alias apt='sudo apt'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'
alias grep='grep --color=auto'
alias buildsuck='sudo make install clean && rm config.h'

# Starship Prompt
eval "$(starship init bash)"
. "$HOME/.cargo/env"
