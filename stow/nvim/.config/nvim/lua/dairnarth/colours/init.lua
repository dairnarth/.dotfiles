local M = {}

M.load = function(contrast)
  local groups = require('dairnarth.colours.groups').setup(contrast)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if contrast == 'normal' then
    vim.g.colors_name = "colours"
  else
    vim.g.colors_name = "colours-dim"
  end
  vim.o.termguicolors = true

  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
