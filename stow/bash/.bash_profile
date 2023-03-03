#
# ~/.bash_profile
#
export PATH="$HOME/.config/bash/scripts:$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export ALTBROWSER="lynx"

export QT_QPA_PLATFORMTHEME="qt5ct"

# tty colours to gruvbox
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0282828"   # black
    echo -en "\e]P1cc241d"   # dark red
    echo -en "\e]P298971a"   # dark green
    echo -en "\e]P3d79921"   # dark yellow
    echo -en "\e]P4458588"   # dark blue
    echo -en "\e]P5b16286"   # dark magenta
    echo -en "\e]P6689d6a"   # dark cyan
    echo -en "\e]P7a89984"   # light grey
    echo -en "\e]P8928374"   # dark grey
    echo -en "\e]P9fb4934"   # light red
    echo -en "\e]PAb8bb26"   # light green
    echo -en "\e]PBfabd2f"   # light yellow
    echo -en "\e]PC83a598"   # light blue
    echo -en "\e]PDd3869b"   # light magenta
    echo -en "\e]PE8ec07c"   # light cyan
    echo -en "\e]PFebdbb2"   # white

    if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -le 3 ]; then
        mkdir -p "$HOME/.local/share/X"
        while true; do
            clear
            read -sn 1 -t 1 sel
            case ${sel,} in
                'd'|'') startx ~/.xinitrc dwm &> ~/.local/share/X/current.log;;
                'o')    clear
                        read wm
                        startx ~/.xinitrc "$wm" &> ~/.local/share/X/current.log;;
                't')    tmux-default ;;
                'q')    exit ;;
                *)      ;;
            esac
        done
    fi
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
