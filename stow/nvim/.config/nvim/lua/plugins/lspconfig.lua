return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      {
        'hrsh7th/nvim-cmp',
        dependencies = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'uga-rosa/cmp-dictionary'
        }
      },
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'bashls',
          'clangd',
          'sumneko_lua',
          'pyright',
        }
      })

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_attach = function(client, bufnr)
          local opts = {buffer = bufnr, remap = false}
          vim.keymap.set('n', 'gd',          function() vim.lsp.buf.definition()       end, opts)
          vim.keymap.set('n', 'K',           function() vim.lsp.buf.hover()            end, opts)
          vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set('n', '<leader>vd',  function() vim.diagnostic.open_float()    end, opts)
          vim.keymap.set('n', '[d',          function() vim.diagnostic.goto_next()     end, opts)
          vim.keymap.set('n', ']d',          function() vim.diagnostic.goto_prev()     end, opts)
          vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action()      end, opts)
          vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references()       end, opts)
          vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename()           end, opts)
          vim.keymap.set('i', '<C-h>',       function() vim.lsp.buf.signature_help()   end, opts)
      end

      local lspconfig = require('lspconfig')
      require('mason-lspconfig').setup_handlers({
        function(server)
          lspconfig[server].setup({
            on_attach    = lsp_attach,
            capabilities = lsp_capabilities
          })
        end,
      })

      vim.o.completeopt = 'menuone,noselect'
      vim.o.signcolumn  = 'no'

      local cmp = require('cmp')
      cmp.setup({
        mapping = {
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.close(),
        },
        sources = {
          {name = 'nvim_lsp'},
          {name = 'buffer'},
          {name = 'path'},
          {name = "dictionary",
           keyword_length = 2},
        }
      })

      cmp.setup.cmdline('/', {
        sources = {
          {name = 'buffer'}
        }
      })

      cmp.setup.cmdline(':', {
        sources = {
          {name = 'path'},
          {name = 'buffer'},
          {name = 'cmdline'}
        }
      })

      require("cmp_dictionary").setup({
          dic = {
              ["*"] = "~/.local/share/dict/ukenglish.txt",
          },
      })
    end
  },
}
