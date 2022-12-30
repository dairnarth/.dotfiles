#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $- == *i* ]] && . ~/.local/share/blesh/ble.sh --noattach --rcfile ~/.config/bash/blesh/blerc

[[ -e ~/.config/bash ]] && for file in ~/.config/bash/*; do
    [[ -f "$file" ]] && . "$file"
done

[[ ${BLE_VERSION-} ]] && ble-attach
