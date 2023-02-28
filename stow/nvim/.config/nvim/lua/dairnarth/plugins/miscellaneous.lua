return {
  {
    'folke/zen-mode.nvim',
    init = function()
      vim.keymap.set('n', '<leader>z', ':ZenMode<cr>', {silent = true})
    end,
    cmd = 'ZenMode',
    config = function()
      require'zen-mode'.setup({
        window = {
          backdrop = 1,
          width = math.max(#tostring(vim.api.nvim_buf_line_count(0)) + 1, 2, vim.wo.numberwidth) + 80,
          height = 0.95,
          options = {
              number = true,
              relativenumber = false,
              spell = true,
              wrap = true,
              linebreak = true,
              colorcolumn = ''
          }
        },
        plugins = {
          tmux = {enabled = true}
        }
      })
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    cmd = 'ColorizerToggle',
    config = true
  },
  'godlygeek/tabular'
}
