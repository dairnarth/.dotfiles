if status is-interactive
    set abbralias abbr
else
    set abbralias alias
end

$abbralias c   'config'
$abbralias ce  'config edit'
$abbralias cg  'config git'
$abbralias cne 'config nix edit'
$abbralias cnr 'config nix rebuild'
$abbralias g   'git'
$abbralias n   'nix'
$abbralias mkd 'mkdir -pv'
$abbralias p   'paru'
$abbralias r   'ranger'
$abbralias s   'sudo'
$abbralias v   'nvim'
$abbralias z   'zathura'

alias ls  'eza -aagl --group-directories-first'
alias lt  'eza -glT --group-directories-first'
alias lta 'eza -aglT --group-directories-first'
