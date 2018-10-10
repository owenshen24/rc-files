#!/bin/bash
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export SHELL=/bin/bash

function get_hostname {
  export SHORTNAME=${HOSTNAME%%.*}
}

function user_color {
  id | grep "Admin" > /dev/null
  RETVAL=$?
  if [[ $RETVAL == 0 ]]; then
    usercolor="[0;32m";
  else
    usercolor="[0;32m";
  fi
}

function settitle() {
  u=${USERNAME}
  h="$u@${HOSTNAME}"
  echo -ne "\e]2;$h\a\e]1;$h\a";
}

# Set directory colors
eval `dircolors ~/.dir_colors`

# Set prompt and window title
inputcolor='[0;37m'
cwdcolor='[0;34m'
host_name='[1;31m'
user_color
# PROMPT_COMMAND='settitle; get_hostname; history -a;'

# export PS1='\n\n\[\e${cwdcolor}\][$PWD]\n\[\e${usercolor}\][\u]\[\e${host_name}\][${SHORTNAME}]\[\e${inputcolor}\] $ '

export PS1='\n\n\[\e${cwdcolor}\][$PWD]\n\[\e${usercolor}\]\[\e${inputcolor}\] $ '

export PROMPT_COMMAND="echo -n \[\$(date +%H:%M)\]\ "

# export PS1="\[\033[38;5;200m\][\[$(tput sgr0)\]\[\033[38;5;196m\]\@\[$(tput sgr0)\]\[\033[38;5;200m\]]\[$(tput sgr0)\]\[\033[38;5;14m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]"


# Aliases
alias ls='ls -l --color'
alias grep='grep -n --color'
alias env='source activate'
alias pythong='python'
alias edit='moeditor'
alias ppjson="python -m json.tool"
alias ccc="g++ -Wall"
alias pdf="xdg-open"


# FUNCTIONS:
# lazygit
function lazygit() {
    git add --all
    git commit -a -m "$1"
    git push
}
export -f lazygit

# ghostwriter
function ghost() {
  ghostwriter-casept.ghostwriter "$1" >/dev/null &>/dev/null &
}
export -f ghost

# google chrome
function chrome() {
  google-chrome
}
export -f chrome

