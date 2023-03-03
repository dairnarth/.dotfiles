vim.api.nvim_create_augroup('autocmds', {clear = true})
vim.api.nvim_create_autocmd('VimResized', {
  command = 'wincmd =',
  group = 'autocmds'
})
vim.api.nvim_create_autocmd('VimLeave', {
  callback = vim.fn.system('tmux set status on'),
  group = 'autocmds'
})
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    local curpos = vim.fn.getcurpos()
    vim.cmd([[silent! %s/\s\+$//e]])
    vim.cmd([[silent! v/\_s*\S/d]])
    vim.fn.setpos('.', curpos)
  end,
  group = 'autocmds'
})
