#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PROMPT_COMMAND='if [ $? -eq 0 ]; then c=92; else c=91; fi; PS1="\W \[\e[${c}m\]>\[\e[0m\] "'

alias gwenview='flatpak run org.kde.gwenview 2>/dev/null'

# pywal16
# (cat ~/.cache/wal/sequences &)

# export Xdefaults
# xrdb -merge ~/.Xdefaults

# enalbe Bitwarden SSH Agent
export SSH_AUTH_SOCK=/home/jonny/.bitwarden-ssh-agent.sock

# Created by `pipx` on 2026-09-14 06:25:15
export PATH="$PATH:/home/jonny/.local/bin"

export PATH=$PATH:/home/jonny/.spicetify
export PATH=$PATH:~/.spicetify
. "$HOME/.cargo/env"
alias config='/usr/bin/git --git-dir=/home/jonny/.cfg/ --work-tree=/home/jonny'
