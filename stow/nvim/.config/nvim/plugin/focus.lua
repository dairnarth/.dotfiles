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
    if vim.wo.number == true then
        vim.wo.relativenumber = true
    end
    require('styler').clear(0)
    require('colorizer').attach_to_buffer()
  end,
  group = 'focus'
})
vim.api.nvim_create_autocmd({'WinLeave', 'FocusLost'}, {
  callback = function()
    if vim.wo.number == true then
        vim.wo.relativenumber = false
    end
    require('styler').set_theme(0, {colorscheme = 'colours-dim'})
    require('colorizer').detach_from_buffer()
  end,
  group = 'focus'
})
