#
# ~/.bashrc
#

# Si estamos en la primera terminal de texto (TTY1), arranca X automáticamente
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx >/dev/null 2>&1
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(dircolors -b ~/.dircolors)"
 
PS1='\[\e[1;94m\]\w \[\e[1;96m\]>\[\e[0;97m\] '

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -la'
alias grep='grep --color=auto'
alias cl='clear'
alias d='date'
alias ssn='sudo shutdown now'
alias srr='sudo reboot'
alias iwsw='iwctl station wlan0'
alias wps='wpctl set-volume @DEFAULT_SINK@'
alias wpg='wpctl get-volume @DEFAULT_SINK@'
alias brg='brightnessctl g'
alias brs='brightnessctl s'
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
