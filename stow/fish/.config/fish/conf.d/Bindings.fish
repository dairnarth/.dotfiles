fish_vi_key_bindings
bind -M default s true
bind -M default S true

for mode in (bind -L)
    bind -M $mode \r enter
end

bind -M default H prevd-or-backward-word
bind -M default L nextd-or-forward-word
bind -M default ss enter
bind -M default ZQ exit
bind -M default ZZ exit
