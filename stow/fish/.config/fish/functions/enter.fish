function enter
    if commandline --is-valid
        set -g transient
        commandline -f suppress-autosuggestion
        commandline -f repaint
        commandline -f execute
    end
end
