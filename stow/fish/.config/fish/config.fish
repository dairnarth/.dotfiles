if status is-interactive
    if not set -q TMUX
        if tmux attach-session -t default 2>/dev/null
            exit 0
        else
            tmux new -s default -d
            tmux rename-window -t default sys-mon
            tmux send-keys -t default 'btop' Enter
            tmux new-window -t default
            exec tmux attach-session -t default
        end
    end
end
