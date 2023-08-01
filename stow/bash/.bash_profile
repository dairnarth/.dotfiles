#
# ~/.bash_profile
#
export PATH="$HOME/.local/share/scripts:$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export ALTBROWSER="lynx"

export QT_QPA_PLATFORMTHEME="qt5ct"

# tty colours to gruvbox
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P02d2525"   # black
    echo -en "\e]P1eb5b4b"   # dark red
    echo -en "\e]P2b0bb39"   # dark green
    echo -en "\e]P3d0a63f"   # dark yellow
    echo -en "\e]P48fa9ba"   # dark blue
    echo -en "\e]P5c180a7"   # dark magenta
    echo -en "\e]P686b78e"   # dark cyan
    echo -en "\e]P7c09d91"   # light grey
    echo -en "\e]P88c7068"   # dark grey
    echo -en "\e]P9eb5b4b"   # light red
    echo -en "\e]PAb0bb39"   # light green
    echo -en "\e]PBd0a63f"   # light yellow
    echo -en "\e]PC8fa9ba"   # light blue
    echo -en "\e]PDc180a7"   # light magenta
    echo -en "\e]PE86b78e"   # light cyan
    echo -en "\e]PFfdd6c9"   # white

    if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -le 3 ]; then
        mkdir -p "$HOME/.local/share/X"
        logfile="$HOME/.local/share/X/current.log"
        while true; do
            clear
            read -sn 1 -t 1 sel
            case ${sel,} in
                '')     startx ~/.xinitrc qtile start &> "$logfile";;
                'd')    startx ~/.xinitrc dwm &> "$logfile";;
                'o')    clear
                        read wm
                        startx ~/.xinitrc "$wm" &> "$logfile";;
                't')    tmux-default ;;
                'q')    exit ;;
                *)      ;;
            esac
        done
    fi
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
