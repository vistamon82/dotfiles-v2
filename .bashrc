#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la'
alias rr='rm -rf'

#PS1='[\u@\h \W]\$ '

export PS1="\[\033[38;5;11m\]\u\[$()\]\[\033[38;5;15m\]@\h:\[$()\]\[\033[38;5;6m\][\w]:\[$()\]\[\033[38;5;15m\] \[$()\]"
