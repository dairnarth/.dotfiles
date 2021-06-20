" General Settings
set tabstop=4 softtabstop=4                         " tab size
set shiftwidth=4                                    " size of indents
set expandtab                                       " tabs are spaces now
set smartindent                                     " indents on new line creation
set number relativenumber                           " line numbers (relative to position)
set nowrap                                          " text doesn't wrap
set ignorecase                                      " case insensitive search
set smartcase                                       " turns off the above with a mixed case search string.
set splitbelow splitright                           " split mor intuitively
set incsearch                                       " shows search results while still searching
set undofile                                        " saves undo history to a file
set noswapfile                                      " doesn't create a swap file when switching buffers
set colorcolumn=80                                  " sets colour colomn width

" Vim Plugged
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'junegunn/goyo.vim'
    Plug 'morhetz/gruvbox'
    Plug 'mbbill/undotree'
    Plug 'preservim/nerdtree'
    Plug 'Shougo/deoplete.nvim'
call plug#end()

"Colourscheme
set background=dark                                 " required by gruvbox for dark mode
colorscheme gruvbox
" Commands
command! Prose inoremap <buffer> . .<C-G>u|
            \ inoremap <buffer> ! !<C-G>u|
            \ inoremap <buffer> ? ?<C-G>u|
            \ setlocal spell spelllang=en nolist wrap linebreak fo=t1 fdm=manual|
            \ call deoplete#disable()

command! Code silent! iunmap <buffer> .|
            \ silent! iunmap <buffer> !|
            \ silent! iunmap <buffer> ?|
            \ setlocal nospell nolist nowrap tw=0 fo=tcq fo-=a fdm=indent|
            \ call deoplete#enable()

" Leader Shortcuts
let mapleader =" "

    map <leader>f :Goyo \| set linebreak<CR>
    map <leader>c :Code<CR>
    map <leader>p :Prose<CR>
    map <leader>n :NERDTreeToggle<CR>
    map <leader>u :UndotreeToggle<CR>

" Mappings
nnoremap <s-tab> zA
map K <Nop>
map Q <Nop>

" Auto Commands
autocmd VimResized * wincmd =                       " automatically resize splits when vim is resized
autocmd BufWritePre * %s/\s\+$//e                   " delete trailing whitespace
autocmd BufNewFile *.mom 0put =\".PAPER A4\<nl>     " adds formatting header to .mom files
            \.PRINTSTYLE TYPESET\<nl>
            \.L_MARGIN 2.5cm\<nl>
            \.R_MARGIN 2.5cm\<nl>
            \.DOCTYPE ___
            \\\#\<nl>
            \.FAMILY T\<nl>
            \.PT_SIZE 11\<nl>
            \.AUTOLEAD 1\<nl>
            \\\#\<nl>
            \.START\<nl>
            \\<nl>
            \\"|$
autocmd BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
                                                    " source init.vim every time its written to

" Plugin Specific Settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:deoplete#enable_at_startup = 1

