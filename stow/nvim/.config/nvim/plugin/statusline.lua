vim.o.laststatus = 3
vim.o.cmdheight  = 0
vim.o.statusline = require('dairnarth.statusline').enclose('print()')

vim.api.nvim_create_augroup('statusline', {clear = true})
vim.api.nvim_create_autocmd({'Colorscheme', 'VimEnter'}, {
  callback = function()
    require('dairnarth.statusline').highlight()
  end,
  group = 'statusline'
})
