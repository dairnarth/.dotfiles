" Normal Mappings

" Sane Y mapping
nnoremap Y y$

" Open folds with <s-tab>
nnoremap <s-tab> zA

" Disabled Mappings
nnoremap K <Nop>
nnoremap Q <Nop>
nnoremap s <Nop>
nnoremap S <Nop>

" Easy Saving
nnoremap ss :w<CR>
nnoremap sa :w <C-r>%
nnoremap so :w \| source % \| echo 'Sourced'expand("%")<CR>

" Better Movement
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz
nnoremap [[ [[zz
nnoremap ]] ]]zz

" window movement bindings
lua require("nvim-tmux-navigation").setup {}

nnoremap <silent> <C-h>     :NvimTmuxNavigateLeft<CR>
nnoremap <silent> <C-j>     :NvimTmuxNavigateDown<CR>
nnoremap <silent> <C-k>     :NvimTmuxNavigateUp<CR>
nnoremap <silent> <C-l>     :NvimTmuxNavigateRight<CR>
nnoremap <silent> <C-\>     :NvimTmuxNavigateLastActive<CR>
