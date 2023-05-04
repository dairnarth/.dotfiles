local abc = require'dairnarth.abc'

vim.keymap.set('n', '<localleader>s', abc.view.continuous_start,     {buffer = true})
vim.keymap.set('n', '<localleader>r', abc.view.compile_once,         {buffer = true})
vim.keymap.set('n', '<localleader>p', abc.play,                      {buffer = true})
vim.keymap.set('n', '<localleader>c', function() abc.play(true) end, {buffer = true})
