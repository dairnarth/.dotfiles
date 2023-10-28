function ssh
    if test -z $TMUX
        echo here
        command ssh $argv
        return
    end
    for arg in $argv
        if string match -r '@' $arg &>/dev/null
            set title $arg
        end
    end

    tmux rename-window $title
    command ssh $argv
    tmux set-window-option automatic-rename on 1>/dev/null
end
