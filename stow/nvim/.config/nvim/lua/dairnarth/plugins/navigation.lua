return {
  {
    'nvim-telescope/telescope.nvim',
    init = function()
      local telescope_files = function()
        vim.fn.system('git rev-parse --is-inside-work-tree')
        if vim.v.shell_error == 0 then
          require'telescope.builtin'.git_files({hidden = true})
        else
          require'telescope.builtin'.find_files({hidden = true})
        end
      end
      vim.keymap.set('n', '<leader>ff', telescope_files)
      vim.keymap.set('n', '<leader>fb', require'telescope.builtin'.buffers)
      vim.keymap.set('n', '<leader>fh', require'telescope.builtin'.help_tags)
      vim.keymap.set('n', '<leader>fs', require'telescope.builtin'.spell_suggest)
      vim.keymap.set('n', '<leader>gc', require'telescope.builtin'.git_commits)
      vim.api.nvim_create_augroup('telescope', {clear = true})
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          if vim.fn.argc() == 0 then
            telescope_files()
          end
        end,
        group = 'telescope'
      })
    end,
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'mbbill/undotree',
    init = function()
      vim.keymap.set('n', '<leader>fu', ':UndotreeToggle<CR>',  {silent = true})
    end,
    cmd = 'UndotreeToggle'
  },
  {
    'alexghergh/nvim-tmux-navigation',
    init = function()
      vim.keymap.set('n', '<C-h>', require'nvim-tmux-navigation'.NvimTmuxNavigateLeft)
      vim.keymap.set('n', '<C-j>', require'nvim-tmux-navigation'.NvimTmuxNavigateDown)
      vim.keymap.set('n', '<C-k>', require'nvim-tmux-navigation'.NvimTmuxNavigateUp)
      vim.keymap.set('n', '<C-l>', require'nvim-tmux-navigation'.NvimTmuxNavigateRight)
    end
  }
}
