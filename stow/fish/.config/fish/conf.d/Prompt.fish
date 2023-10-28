set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_showcolorhints true

function fish_mode_prompt; end

function fish_prompt;
    set -l cmd_status $status
    set -l vcs (string replace -ar '[()]' '' (string replace -a '|' ' ' (fish_vcs_prompt)))
    set -l cols (tput cols)

    set_color 8fa9ba blue;    printf ' %s' $USER
    set_color c09d91 white;   printf '@'
    set_color c180a7 magenta; printf '%s'  $hostname
    set_color 86b78e cyan;    printf ' %s' (prompt_pwd)
    set_color fdd6c9 normal;  printf '%s'  $vcs
    if test $cmd_status -gt 0
        set_color eb5b4b red; printf ' %s' $cmd_status
    end
    printf '\n'
    if set -e transient
        printf 'cub %s\nel\ncuu 1\nel' $cols | tput -S
        set_color fdd6c9 normal
        printf ' ■ '
    else
        switch $fish_bind_mode
            case default
                set_color fdd6c9 normal
            case insert
                set_color d0a63f yellow
            case replace
                set_color dd855b 173
            case replace_one
                set_color dd855b 173
            case visual
                set_color 8fa9ba blue
            case '*'
                set_color c180a7 red
        end
        printf ' ■ '
        set_color fdd6c9 normal
    end
end
