function brightnessctl
    command brightnessctl $argv

    set -l current (command brightnessctl g)
    set -l max (command brightnessctl m)
    set -l brt (printf '%3d' (math -s 0 $current / $max '*' 100))
    dunstify -h string:x-dunst-stack-tag:brt -h "int:value:$brt" "Brightness: $brt%"
end
