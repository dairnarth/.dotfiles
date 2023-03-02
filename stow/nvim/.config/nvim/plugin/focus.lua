vim.api.nvim_create_augroup('focus', {clear = true})

vim.api.nvim_create_autocmd('InsertEnter', {
  command = 'set cursorline',
  group = 'focus'
})
vim.api.nvim_create_autocmd('InsertLeave', {
  command = 'set nocursorline',
  group = 'focus'
})
