vim.o.laststatus = 3
vim.o.cmdheight  = 0

vim.api.nvim_create_augroup('statusline', {clear = true})

vim.api.nvim_create_autocmd({'BufEnter', 'Colorscheme', 'CursorMoved', 'FocusGained', 'ModeChanged', 'VimEnter' , 'WinEnter'}, {
  callback = function()
    vim.wo.relativenumber = true
  end,
  group = 'statusline'
})

vim.api.nvim_create_autocmd({'BufLeave', 'FocusLost', 'WinLeave'}, {
  callback = function()
    vim.wo.relativenumber = false
  end,
  group = 'statusline'
})

vim.o.statusline = require('dairnarth.statusline').enclose('print()')

vim.cmd.highlight({'Statusline', 'guifg=#ebdbb2', 'guibg=#282828', 'gui=none'})
vim.cmd.highlight({'SLIt',       'guifg=#ebdbb2', 'guibg=#282828', 'gui=italic'})
vim.cmd.highlight({'SLDim',      'guifg=#a89984', 'guibg=#282828', 'gui=none'})
vim.cmd.highlight({'SLDimIt',    'guifg=#a89984', 'guibg=#282828', 'gui=italic'})
vim.cmd.highlight({'SLModeN',    'guifg=#ebdbb2', 'guibg=#282828', 'gui=none'})
vim.cmd.highlight({'SLModeI',    'guifg=#d79921', 'guibg=#282828', 'gui=none'})
vim.cmd.highlight({'SLModeR',    'guifg=#d75f00', 'guibg=#282828', 'gui=none'})
vim.cmd.highlight({'SLModeV',    'guifg=#458588', 'guibg=#282828', 'gui=none'})
vim.cmd.highlight({'SLModeC',    'guifg=#282828', 'guibg=#282828', 'gui=none'})
vim.cmd.highlight({'SLModeT',    'guifg=#ebdbb2', 'guibg=#282828', 'gui=none'})
vim.cmd.highlight({'SLModeM',    'guifg=#cc241d', 'guibg=#282828', 'gui=none'})
vim.cmd.highlight({'SLModeMod',  'guifg=#cc241d', 'guibg=#282828', 'gui=none'})
