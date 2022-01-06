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
set nospell
set nolist
set nowrap
set tw=0
set fo=tcq
set fo-=a
set fdm=indent

" Vim Plugged
call plug#begin('~/.config/nvim/plugged')
    " Colourscheme
    Plug 'morhetz/gruvbox'
    " Completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    " Focus
    Plug 'folke/zen-mode.nvim'
    " Git
    Plug 'tpope/vim-fugitive'
    " Navigation
    Plug 'mbbill/undotree'
    Plug 'preservim/nerdtree'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Prettyify
    Plug 'godlygeek/tabular'
call plug#end()

" Colourscheme
set background=dark         " required by gruvbox for dark mode
colorscheme gruvbox

" Plugin Specific Settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
