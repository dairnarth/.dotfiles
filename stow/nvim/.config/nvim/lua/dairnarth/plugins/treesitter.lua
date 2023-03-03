return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
        'nvim-treesitter/playground',
    },
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "bash", "c", "lua", "python", "query", "vim", "help" },
        ignore_install   = { "latex" },

        sync_install = false,
        auto_install = true,

        highlight = {enable = true},
        indent    = {enable = true},
      }
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr   = 'nvim_treesitter#foldexpr()'
      vim.o.foldenable = false
    end
  }
}
