" init.vim

let g:dairnarth = 1

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
    Plug 'uga-rosa/cmp-dictionary'
    Plug 'lervag/vimtex'
    " Focus
    Plug 'folke/zen-mode.nvim'
    " Git
    Plug 'tpope/vim-fugitive'
    " Navigation
    Plug 'alexghergh/nvim-tmux-navigation'
    Plug 'mbbill/undotree'
    Plug 'preservim/nerdtree'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Prettyify
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'godlygeek/tabular'
call plug#end()

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
