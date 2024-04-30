#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='exa -l -g --icons'
alias tree='exa --tree --icons'
alias vim='nvim'
alias fetch='source ~/.config/bspwm/fetch.sh'

PS1="\e[0;32m\u\e[0m@\H \e[0;32m\W>\e[0m "
