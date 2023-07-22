# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup Environment Variables
export STARSHIP_CONFIG=$HOME/.config/starship.toml
export SCRIPTDIR=$HOME/.local/share/scriptdeps
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin
export EDITOR=nvim

# Set Environment Aliases
alias ls='lsd -l'
alias la='lsd -al'
alias ..='cd ..'
alias ...='cd ../..'
alias vifm='vifmrun'
alias vim='nvim'
alias svim='sudo nvim'
alias chmod='sudo chmod'
alias cleanup='sudo emerge --depclean'
alias emerge='sudo emerge -a'
alias esync='sudo emaint -a sync'
alias uninstall='sudo emerge --deselect'
alias update='sudo emerge -auDN @world'
alias econf='sudo dispatch-conf'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'
alias rc-update='sudo rc-update'
alias grep='grep --color=auto'
alias buildsuck='sudo make install clean && rm config.h'
alias mount='sudo mount'
alias umount='sudo umount'

# Starship Prompt
eval "$(starship init bash)"

# Setup Rustup Environment
. "$HOME/.cargo/env"

squirtle
