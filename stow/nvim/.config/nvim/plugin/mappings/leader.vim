" Leader Mappings

let mapleader =" "

" ../commands.vim
map <leader>c :Code<CR>
map <leader>p :Prose<CR>

" Unhighlight search
map <leader>/ :nohlsearch<CR>

" Telescope
map <leader>ff :lua require('telescope.builtin').find_files({hidden = true})<CR>
map <leader>fb :lua require('telescope.builtin').file_browser({hidden = true})<CR>

" Focus
let g:zenOn=0
function! leader#focustoggle()
    if g:zenOn==1
        lua require('zen-mode').close()
        lua vim.fn.system([[tmux set status on]])
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
        lua vim.fn.system([[tmux set status off]])
        let g:zenOn=1
        endif
endfunction

map <silent> <leader>z :call leader#focustoggle()<CR>

" vim-fugitive
map <leader>gs :G<CR>
map <leader>gp :G push<CR>
map <leader>gl :G log<CR>

" NERDTree
map <leader>n :NERDTreeToggle<CR>

"UndoTree
map <leader>u :UndotreeToggle<CR>
