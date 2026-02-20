function config
    cd $HOME/.dotfiles
    if test (count $argv) -eq 0
        set argv[1] git
    end
    switch $argv[1]
        case cd c
            return
        case edit e
            if set -q $argv[2]
                nvim
            else
                if test -d stow/$argv[2]/.config/$argv[2]
                    nvim stow/$argv[2]/.config/$argv[2]
                else if test -d stow/$argv[2]
                    nvim stow/$argv[2]
                else
                    nvim
                end
            end
        case git g
            git $argv[2..-1]
        case nix n
            switch $argv[2]
                case edit e
                    nvim nix/flake.nix
                case rebuild r
                    sudo darwin-rebuild switch --flake nix/
            end
    end
    cd -
end
