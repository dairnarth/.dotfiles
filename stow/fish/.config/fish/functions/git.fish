function git
    set -l gitarg $argv[1]
    switch $argv[1]
        case a
            command git add $argv[2..-1]
        case cm
            command git commit $argv[2..-1]
        case co
            command git checkout $argv[2..-1]
        case l
            command git log $argv[2..-1]
        case lg
            command git log --branches --oneline --graph --decorate $argv[2..-1]
        case pl
            command git pull $argv[2..-1]
        case ps
            command git push $argv[2..-1]
        case st ''
            command git status $argv[2..-1]
        case sm
            command git submodule $argv[2..-1]
        case '*'
            command git $argv
    end
end
