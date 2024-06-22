#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export PATH=$PATH:~/.local/bin

export VISUAL=nvim
export EDITOR=nvim

alias ll='eza -l --icons'
alias tree='eza --tree --icons'
alias vim='nvim'
alias rr='ranger'

PS1='\u@\h \W> $ '
