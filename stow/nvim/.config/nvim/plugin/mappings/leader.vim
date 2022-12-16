" Leader Mappings

let mapleader = " "

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

" Telescope
function! mappings#leader#telescope()
    let l:isgit = system('git')
    exec v:shell_error ?
      \ "lua require('telescope.builtin').find_files({hidden = true})" :
      \ "lua require('telescope.builtin').git_files({hidden = true})"
endfunction

map <silent> <leader>f :call mappings#leader#telescope()<CR>

" Focus
let g:zenOn=0
function! mappings#leader#focustoggle()
    if g:zenOn==1
        lua require('zen-mode').close()
        call system('tmux set status on')
        let g:zenOn=0
    else
        let l:zenWidth=max([strlen(line('$')) + 1, &numberwidth]) + 80
        let l:zenHeight=&lines - 3
        exec "lua require('zen-mode').open({ "
                    \ . "window = { "
                    \ .     "width = "  . l:zenWidth . ", "
                    \ .     "height = " . l:zenHeight . ", "
                    \ .     "options = {"
                    \ .     "number = true, "
                    \ .     "relativenumber = false, "
                    \ .     "wrap = true, "
                    \ .     "linebreak = true, "
                    \ .     "colorcolumn = '' "
                    \ . "} }, "
                    \ . "})"
        call system('tmux set status off')
        let g:zenOn=1
        endif
endfunction

map <silent> <leader>z :call mappings#leader#focustoggle()<CR>

" vim-fugitive
map <leader>gs :G<CR>
map <leader>gp :G push<CR>
map <leader>gl :G log<CR>

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <silent> <leader>n :NERDTreeToggle<CR>

"UndoTree
map <silent> <leader>u :UndotreeToggle<CR>
