function ssh
    if test -z $TMUX
        echo here
        command ssh $argv
        return
    end
    set -l title
    for arg in $argv
        if string match -r @ $arg
            echo '1:' $arg
            set title $arg
        end
    end
    echo $title
end
