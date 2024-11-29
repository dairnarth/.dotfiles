if status is-interactive
    if not set -q TMUX
        exec tmux-default
    end
end
