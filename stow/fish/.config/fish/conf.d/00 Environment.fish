set -gx PATH $HOME/.local/share/scripts $HOME/.local/bin $PATH
set -gx EDITOR "nvim"
set -gx TERMINAL "kitty"
set -gx BROWSER "qutebrowser"

set -g fish_greeting
set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore
set -g fish_cursor_visual block
fish_vi_key_bindings
