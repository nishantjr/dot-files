# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1='[\u@\h \W]\$ '
export EDITOR='vim'

export PATH="/usr/lib/colorgcc/bin:$PATH"
