" Leader Mappings

" Prose/Code mappings
command! Prose inoremap <buffer> . .<C-G>u|
             \ inoremap <buffer> , ,<C-G>u|
             \ inoremap <buffer> ! !<C-G>u|
             \ inoremap <buffer> ? ?<C-G>u|
             \ inoremap <buffer> : :<C-G>u|
             \ inoremap <buffer> ; ;<C-G>u|
             \ setlocal spell spelllang=en wrap linebreak fdm=manual

command! Code silent! iunmap <buffer> .|
            \ silent! iunmap <buffer> ,|
            \ silent! iunmap <buffer> !|
            \ silent! iunmap <buffer> ?|
            \ silent! iunmap <buffer> :|
            \ silent! iunmap <buffer> ;|
            \ setlocal nospell nowrap tw=0 fdm=indent

map <silent> <leader>p :Prose<CR>
map <silent> <leader>c :Code<CR>

" Unhighlight search
map <silent> <leader>/ :nohlsearch<CR>
