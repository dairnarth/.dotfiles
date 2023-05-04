local M = {}

M.view = require'dairnarth.abc.view'
M.play = require'dairnarth.abc.play'

M.config = {
  player = 'mpv '
    .. '--player-operation-mode=pseudo-gui '
    .. '--loop=inf ',
  speed  = 1.8,
  viewer = 'zathura',
}

M.setup = function(config)
  M.config = vim.tbl_deep_extend('force', M.config, config or {})
end

return M
