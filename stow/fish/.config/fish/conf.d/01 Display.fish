if [ $TERM = 'linux' ]
    echo -en "\e]P02d2525" # black
    echo -en "\e]P1eb5b4b" # dark red
    echo -en "\e]P2b0bb39" # dark green
    echo -en "\e]P3d0a63f" # dark yellow
    echo -en "\e]P48fa9ba" # dark blue
    echo -en "\e]P5c180a7" # dark magenta
    echo -en "\e]P686b78e" # dark cyan
    echo -en "\e]P7c09d91" # light grey
    echo -en "\e]P88c7068" # dark grey
    echo -en "\e]P9eb5b4b" # light red
    echo -en "\e]PAb0bb39" # light green
    echo -en "\e]PBd0a63f" # light yellow
    echo -en "\e]PC8fa9ba" # light blue
    echo -en "\e]PDc180a7" # light magenta
    echo -en "\e]PE86b78e" # light cyan
    echo -en "\e]PFfdd6c9" # white

    if [ -z $DISPLAY ] && [ $XDG_VTNR -le 3 ]
        mkdir -p $HOME'/.local/share/X'
        set -l logfile $HOME'/.local/share/X/current.log'
        exec startx ~/.xinitrc qtile start &> "$logfile"
    end
end
