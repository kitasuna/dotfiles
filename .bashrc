#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. $HOME/.ghcup/env
PATH=$PATH:$HOME/.npm/bin

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Enable good mode
set -o vi

# Yup
export EDITOR='vim'

# For FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
