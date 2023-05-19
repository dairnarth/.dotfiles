#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

blesh="$(~/.config/bash/blesh/autoload)"
. "$blesh" --noattach --rcfile ~/.config/bash/blesh/blerc
clear

[[ -e ~/.config/bash ]] && for file in ~/.config/bash/*; do
    [[ -f "$file" ]] && . "$file"
done

[[ ${BLE_VERSION-} ]] && ble-attach
