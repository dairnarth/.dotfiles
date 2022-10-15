" ftplugin/abc.vim

" FUNCTIONS "
function abc#all(landscape=0, chord=0) abort
    let l:viewcmd = a:landscape ?
      \ 'abcm2ps -lO - "' . expand("%") . '" | ps2pdf - | zathura -' :
      \ 'abcm2ps -O - "' .  expand("%") . '" | ps2pdf - | zathura -'
    let l:viewjob = jobstart(l:viewcmd)
    call abc#play(a:chord)
    call jobstop(l:viewjob)
endfunction

function! abc#play(chord=0) abort
    let l:charg = a:chord ? '' : '-NGUI'
    let l:fn    = '"' . expand("%:p:r") . '.mid"'
    exec '!abc2midi "' . expand("%") . '" ' . l:charg . ' -silent -o ' . l:fn
    exec 'silent !yes "player_tempo_int 1.8player_loop -1" | fluidsynth ' . l:fn . ' &>/dev/null'
    exec '!rm ' . l:fn
endfunction

function! abc#view(landscape=0) abort
    exec a:landscape ?
      \ '!abcm2ps -lO - "' . expand("%") . '" | ps2pdf - | zathura -' :
      \ '!abcm2ps -O - "' .  expand("%") . '" | ps2pdf - | zathura -'
endfunction

" MAPPINGS "
map <buffer> <silent> <leader>vv :call abc#view()<CR><CR>
map <buffer> <silent> <leader>vl :call abc#view(1)<CR><CR>
map <buffer> <silent> <leader>vpp :call abc#play()<CR>
map <buffer> <silent> <leader>vpc :call abc#play(1)<CR>
map <buffer> <silent> <leader>vaa :call abc#all()<CR>
map <buffer> <silent> <leader>val :call abc#all(1)<CR>
map <buffer> <silent> <leader>vaac :call abc#all(0,1)<CR>
map <buffer> <silent> <leader>valc :call abc#all(1,1)<CR>
