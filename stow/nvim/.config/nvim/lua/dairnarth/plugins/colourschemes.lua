return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        italic = false
      })
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      vim.cmd.colorscheme('gruvbox')
      require('dairnarth.colours').highlight()
    end
  },
  {
    'dairnarth/gruvbox-dim.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox-dim').setup({
        italic = false
      })
    end
  },
  {
      'folke/styler.nvim',
      config = function() require'styler'.setup({themes = {}}) end
  },
}
