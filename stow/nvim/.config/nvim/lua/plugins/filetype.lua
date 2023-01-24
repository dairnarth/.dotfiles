return {
  {
    'lervag/vimtex',
    ft = {'latex', 'plaintex', 'tex'},
    config = function()
      vim.g.vimtex_view_method = 'zathura'
      --vim.g.vimtex_compiler_latexmk = { 'options' : [ '-shell-escape', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode', ], }
    end
  },
  {
    'tpope/vim-fugitive',
    init = function()
      vim.keymap.set('n', '<leader>gs', ':G<cr>',      {silent = true})
      vim.keymap.set('n', '<leader>gp', ':G push<cr>', {silent = true})
      vim.keymap.set('n', '<leader>gl', ':G log<cr>',  {silent = true})
    end,
    cmd = "G"
  }
}
