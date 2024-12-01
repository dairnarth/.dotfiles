function mmpv
    trap "pkill -P $fish_pid; sleep 1; tput rmcup" SIGINT

    tput smcup
    sleep 1
    for vid in $argv
        mpv --fs $vid &
    end
    wait
end
