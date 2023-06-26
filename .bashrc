# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd -l'
alias la='lsd -al'
alias ..='cd ..'
alias ...='cd ../..'
alias vim='nvim'
alias dvim='doas nvim'
alias vifm='vifmrun'
alias chmod='doas chmod'
alias pacman='doas pacman'
alias emerge='doas emerge -a'
alias edelete='doas emerge --deselect'
alias eclean='doas emerge -c'
alias emaint='doas emaint'
alias eupdate='emerge -avuDN @world'
alias checkupdates='emerge -pv @system | grep Total | cut -c8-10'
alias eselect='doas eselect'
alias dispatch-conf='doas dispatch-conf'
alias grub-mkconfig='doas grub-mkconfig'
alias reboot='doas reboot'
alias uefi-boot='systemctl reboot --firmware-setup'
alias shutdown='doas shutdown now'
alias grep='grep --color=auto'

# Starship Prompt
eval "$(starship init bash)"
