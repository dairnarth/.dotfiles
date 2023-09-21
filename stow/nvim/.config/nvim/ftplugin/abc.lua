local abc = require'dairnarth.abc'

vim.keymap.set('n', '<localleader>s', abc.view.continuous_start,     {buffer = true})
vim.keymap.set('n', '<localleader>r', abc.view.compile_once,         {buffer = true})
vim.keymap.set('n', '<localleader>p', abc.play,                      {buffer = true})
vim.keymap.set('n', '<localleader>c', function() abc.play(true) end, {buffer = true})

vim.keymap.set('v', '<localleader>tt', abc.transpose,                    {buffer = true})
vim.keymap.set('v', '<localleader>tu', function() abc.transpose(1) end,  {buffer = true})
vim.keymap.set('v', '<localleader>td', function() abc.transpose(-1) end, {buffer = true})

vim.cmd.abbreviate('<buffer>', 'dim',     'o')
vim.cmd.abbreviate('<buffer>', 'halfdim', 'ø')
vim.cmd.abbreviate('<buffer>', 'maj',     'Δ')
