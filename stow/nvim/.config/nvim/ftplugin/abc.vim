" ftplugin/abc.vim

" FUNCTIONS "
function! abc#all(chord=0) abort
    let l:perror = str2nr(system('abcm2ps -O  /dev/null "' . expand("%") . '" 2>&1 | wc -l'))
    let l:lerror = str2nr(system('abcm2ps -lO /dev/null "' . expand("%") . '" 2>&1 | wc -l'))
    echo l:perror . l:lerror
    let l:viewcmd = l:perror <= l:lerror ?
      \ 'abcm2ps -O - "'  . expand("%") . '" | ps2pdf - | zathura -' :
      \ 'abcm2ps -lO - "' .  expand("%") . '" | ps2pdf - | zathura -'
    let l:viewjob = jobstart(l:viewcmd)
    call abc#play(a:chord)
    call jobstop(l:viewjob)
endfunction

function! abc#play(chord=0) abort
    let l:charg = a:chord ? '' : '-NGUI'
    let l:fn    = '"' . expand("%:p:r") . '.mid"'
    exec '!abc2midi "' . expand("%") . '" ' . l:charg . ' -silent -o ' . l:fn
    exec 'silent !while true; do echo "player_tempo_int 1.8player_loop -1"; sleep 10; done | fluidsynth ' . l:fn . ' &>/dev/null'
    exec '!rm ' . l:fn
endfunction

function! abc#view() abort
    let l:perror = str2nr(system('abcm2ps -O  /dev/null "' . expand("%") . '" 2>&1 | wc -l'))
    let l:lerror = str2nr(system('abcm2ps -lO /dev/null "' . expand("%") . '" 2>&1 | wc -l'))
    echo l:perror . l:lerror
    exec l:perror <= l:lerror ?
      \ '!abcm2ps -O - "'  . expand("%") . '" | ps2pdf - | zathura -' :
      \ '!abcm2ps -lO - "' .  expand("%") . '" | ps2pdf - | zathura -'
endfunction

" MAPPINGS "
map <buffer> <silent> <localleader>v :call abc#view()<CR><CR>
map <buffer> <silent> <localleader>p :call abc#play()<CR>
map <buffer> <silent> <localleader>c :call abc#play(1)<CR>
map <buffer> <silent> <localleader>b :call abc#all()<CR>
map <buffer> <silent> <localleader>a :call abc#all(1)<CR>
