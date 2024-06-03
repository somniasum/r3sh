#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias fman='compgen -c | fzf | xargs man'
alias config='bash ~/.config/i3/.config.sh'

#starship initialization
eval "$(starship init bash)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
