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
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      keymaps = {
        ["<ESC>"] = { "actions.close", mode = "n" },
      },
      float = {
        max_width = 0.8,
        max_height = 0.8,
      },
    },
    init = function()
      vim.keymap.set("n", "<leader>fo", require'oil'.open_float)
      vim.api.nvim_create_autocmd("User", {
        pattern = "OilEnter",
        callback = vim.schedule_wrap(function(args)
          local oil = require("oil")
          if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
            oil.open_preview()
          end
        end),
      })
    end
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
