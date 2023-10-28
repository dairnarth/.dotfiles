function pamixer
    command pamixer $argv

    set -l vol (printf '%3d' (command pamixer --get-volume))
    set -l out $vol'%'
    test (command pamixer --get-mute) = true && set out 'Mute'
    dunstify -h string:x-dunst-stack-tag:vol -h "int:value:$vol" "Volume: $out"
end
