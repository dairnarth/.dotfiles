" Commands

" Commands for writing Prose vs Code
command! Prose inoremap <buffer> . .<C-G>u|
            \ inoremap <buffer> ! !<C-G>u|
            \ inoremap <buffer> ? ?<C-G>u|
            \ setlocal spell spelllang=en nolist wrap linebreak fo=t1 fdm=manual

command! Code silent! iunmap <buffer> .|
            \ silent! iunmap <buffer> !|
            \ silent! iunmap <buffer> ?|
            \ setlocal nospell nolist nowrap tw=0 fo=tcq fo-=a fdm=indent|
