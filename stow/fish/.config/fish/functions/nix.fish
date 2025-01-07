function nix
    set -l nixarg $argv[1]
    switch $argv[1]
        case s
            command nix search nixpkgs $argv[2..-1]
        case sh
            command nix-shell --command fish $argv[2..-1]
        case '*'
            command nix $argv
    end
end
