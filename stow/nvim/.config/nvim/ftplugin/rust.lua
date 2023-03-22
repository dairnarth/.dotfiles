vim.api.nvim_create_augroup('rust', {clear = true})
vim.api.nvim_create_autocmd('BufWritePost', {
  buffer = 0,
  command = 'silent !rustfmt %',
  group = 'rust'
})

vim.keymap.set("n", "<localleader>cb", ":!cargo build<CR>",    {buffer = true})
vim.keymap.set("n", "<localleader>cr", ":!cargo run<CR>",      {buffer = true})
