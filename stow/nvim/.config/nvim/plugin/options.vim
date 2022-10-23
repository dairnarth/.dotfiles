" Options
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
set nospell                 " turns off spell checking
set nowrap                  " turns off text wrapping
set tw=0                    " sets textwidth to 0
set fdm=indent fml=5        " folds by indent and prevents small folds
set termguicolors           " turns on gui colours

let $BASH_ENV = "~/.config/bash/aliases"
