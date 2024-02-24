#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias lk='xset led'
alias lo='xset -led'
alias fman='compgen -c | fzf | xargs man'
eval "$(starship init bash)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
