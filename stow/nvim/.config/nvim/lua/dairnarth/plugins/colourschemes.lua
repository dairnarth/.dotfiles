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
      vim.cmd('colorscheme gruvbox')

      vim.cmd.highlight({'ErrorMsg',  'guifg=#fb4934', 'guibg=#282828', 'gui=bold'})
      vim.cmd.highlight({'Search',    'guifg=#fabd2f', 'guibg=#282828', 'gui=bold,italic,underline'})
      vim.cmd.highlight({'IncSearch', 'guifg=#fabd2f', 'guibg=#282828', 'gui=bold,italic,reverse'})
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
