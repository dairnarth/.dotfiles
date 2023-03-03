vim.o.tabstop        = 4        -- tab size
vim.o.shiftwidth     = 4        -- size of indents
vim.o.expandtab      = true     -- tabs are spaces now
vim.o.number         = true     -- line numbers (relative to position)
vim.o.wrap           = false    -- text doesn't wrap
vim.o.ignorecase     = true     -- case insensitive search
vim.o.smartcase      = true     -- turns off the above if mixed case search string
vim.o.splitbelow     = true     -- split mor intuitively
vim.o.splitright     = true
vim.o.undofile       = true     -- saves undo history to a file
vim.o.swapfile       = false    -- doesn't create a swap file when switching buffers
vim.o.colorcolumn    = '80'     -- sets colour colomn location
vim.o.scl            = 'no'     -- turns off sign column
vim.o.wrap           = false    -- turns off text wrapping

vim.cmd[[let $BASH_ENV = "~/.config/bash/aliases"]]
