if status is-interactive
    set abbralias abbr
else
    set abbralias alias
end

$abbralias g   'git'
$abbralias mkd 'mkdir -pv'
$abbralias p   'paru'
$abbralias r   'ranger'
$abbralias s   'sudo'
$abbralias v   'nvim'
$abbralias z   'zathura'

alias ls  'eza -aagl --group-directories-first'
alias lt  'eza -glT --group-directories-first'
alias lta 'eza -aglT --group-directories-first'
