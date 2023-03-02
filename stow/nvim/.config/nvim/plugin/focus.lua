vim.api.nvim_create_augroup('focus', {clear = true})

vim.api.nvim_create_autocmd('InsertEnter', {
  command = 'set cursorline',
  group = 'focus'
})
vim.api.nvim_create_autocmd('InsertLeave', {
  command = 'set nocursorline',
  group = 'focus'
})

vim.api.nvim_create_autocmd({'WinEnter', 'FocusGained'}, {
  callback = function()
    if vim.bo.buftype == '' then
        vim.wo.relativenumber = true
    end
    require('styler').clear(0)
    require('dairnarth.colours').highlight()
  end,
  group = 'focus'
})
vim.api.nvim_create_autocmd({'WinLeave', 'FocusLost'}, {
  callback = function()
    if vim.bo.buftype == '' then
        vim.wo.relativenumber = false
    end
    require('styler').set_theme(0, {
      colorscheme = 'gruvbox-dim',
      background = 'dark'
    })
    require('dairnarth.colours').highlight()
  end,
  group = 'focus'
})
