" Leader Mappings

let mapleader =" "

" ../commands.vim
map <leader>c :Code<CR>
map <leader>p :Prose<CR>

" Unhighlight search
map <leader>/ :nohlsearch<CR>

" Telescope
map <leader>sf :lua require('telescope.builtin').find_files({hidden = true})<CR>
map <leader>sb :lua require('telescope.builtin').file_browser({hidden = true})<CR>

" Terminal
map <leader>tj :sp +te<CR>
map <leader>tl :vs +te<CR>

" Goyo
map <leader>f :Goyo \| set linebreak<CR>

" vim-fugitive
map <leader>gs :G<CR>
map <leader>gp :G push<CR>
map <leader>gl :G log<CR>

" NERDTree
map <leader>n :NERDTreeToggle<CR>

"UndoTree
map <leader>u :UndotreeToggle<CR>
