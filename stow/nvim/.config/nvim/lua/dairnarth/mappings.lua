local M = {}

M.keys = {
  {'n', '<s-tab>',   'za'},
  {'n', 'K',         '<Nop>'},
  {'n', 'Q',         '<Nop>'},
  {'n', 's',         '<Nop>'},
  {'n', 'S',         '<Nop>'},
  {'n', 'ss',        ':w<CR>'},
  {'n', 'sa',        ':w <C-r>%'},
  {'n', 'so',        function() M.so() end},
  {'n', 'n',         'nzz'},
  {'n', 'N',         'Nzz'},
  {'n', '{',         '{zz'},
  {'n', '}',         '}zz'},
  {'n', '[[',        '[[zz'},
  {'n', ']]',        ']]zz'},
  {'n', '<C-h>',     ':NvimTmuxNavigateLeft<CR>',  {silent = true}},
  {'n', '<C-j>',     ':NvimTmuxNavigateDown<CR>',  {silent = true}},
  {'n', '<C-k>',     ':NvimTmuxNavigateUp<CR>',    {silent = true}},
  {'n', '<C-l>',     ':NvimTmuxNavigateRight<CR>', {silent = true}},

  {'n', '<leader>/', ':nohlsearch<CR>',            {silent = true}},
  {'n', '<leader>p', ':Prose<CR>',                 {silent = true}},
  {'n', '<leader>c', ':Code<CR>',                  {silent = true}},

  {'i', '<C-h>',     '<Left>',                     {silent = true}},
  {'i', '<C-j>',     '<Down>',                     {silent = true}},
  {'i', '<C-k>',     '<Up>',                       {silent = true}},
  {'i', '<C-l>',     '<Right>',                    {silent = true}},

  {'t', '<C-w>',     '<C-\\><C-N><C-w>'},
  {'c', '<C-h>',     '<Left>'},
  {'c', '<C-j>',     '<C-n>'},
  {'c', '<C-k>',     '<C-p>'},
  {'c', '<C-l>',     '<Right>'},
}

M.so = function()
  vim.cmd.w()
  if vim.bo.filetype == 'lua' or 'vim' then
    vim.cmd.source()
  end
end

M.set = function()
  vim.g.mapleader = ' '
  for _, key in ipairs(M.keys) do
    vim.keymap.set(unpack(key))
  end
end

M.del = function()
  for _, key in ipairs(M.keys) do
    vim.keymap.del(key[1], key[2])
  end
end

return M
