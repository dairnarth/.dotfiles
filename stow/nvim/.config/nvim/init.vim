" General Settings
set tabstop=4 softtabstop=4 " tab size
set shiftwidth=4            " size of indents
set expandtab               " tabs are spaces now
set smartindent             " indents on new line creation
set number relativenumber   " line numbers (relative to position)
set nowrap                  " text doesn't wrap
set ignorecase              " case insensitive search
set smartcase               " turns off the above if mixed case search string
set splitbelow splitright   " split mor intuitively
set incsearch               " shows search results while still searching
set undofile                " saves undo history to a file
set noswapfile              " doesn't create a swap file when switching buffers
set colorcolumn=80          " sets colour colomn width
set scl=no                  " turns off sign column

" Vim Plugged
call plug#begin('~/.config/nvim/plugged')
    Plug 'junegunn/goyo.vim'
    Plug 'morhetz/gruvbox'
    Plug 'mbbill/undotree'
    Plug 'preservim/nerdtree'
    Plug 'neovim/nvim-lspconfig'
    Plug 'Shougo/deoplete.nvim'
    Plug 'deoplete-plugins/deoplete-lsp'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'tpope/vim-fugitive'
call plug#end()

" Colourscheme
set background=dark         " required by gruvbox for dark mode
colorscheme gruvbox

" Plugin Specific Settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:deoplete#enable_at_startup = 1
