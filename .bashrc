#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias gwenview='flatpak run org.kde.gwenview 2>/dev/null'

# pywal16
(cat ~/.cache/wal/sequences &)

# export Xdefaults
xrdb -merge ~/.Xdefaults

# enalbe Bitwarden SSH Agent
export SSH_AUTH_SOCK=/home/jonny/.bitwarden-ssh-agent.sock

# Created by `pipx` on 2026-09-14 06:25:15
export PATH="$PATH:/home/jonny/.local/bin"

fastfetch

export PATH=$PATH:/home/jonny/.spicetify
export PATH=$PATH:~/.spicetify
. "$HOME/.cargo/env"
alias config='/usr/bin/git --git-dir=/home/jonny/.cfg/ --work-tree=/home/jonny'
