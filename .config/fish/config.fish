# Si estamos en la primera terminal de texto (TTY1), arranca X automáticamente
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx >/dev/null 2>&1
    end
end

set -g fish_greeting ""
zoxide init fish | source

# Alias
alias grep='grep --color=auto'
alias cl='clear'
alias ssn='sudo shutdown now'
alias srr='sudo reboot'
alias iwsw='iwctl station wlan0'
alias wps='wpctl set-volume @DEFAULT_SINK@'
alias wpg='wpctl get-volume @DEFAULT_SINK@'
alias brg='brightnessctl g'
alias brs='brightnessctl s'
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias ncuh="nmcli connection up Hotspot"
alias ncdh="nmcli connection down Hotspot"

# Iniciar tmux automáticamente si no estamos ya dentro de una sesión de tmux
#if status is-interactive
#    and not set -q TMUX
#    exec tmux
#end
