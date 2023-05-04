local M = {}

M.maps = {
  {'i', '.', '.<C-G>u', {buffer = true}},
  {'i', ',', ',<C-G>u', {buffer = true}},
  {'i', '!', '!<C-G>u', {buffer = true}},
  {'i', '?', '?<C-G>u', {buffer = true}},
  {'i', ':', ':<C-G>u', {buffer = true}},
  {'i', ';', ';<C-G>u', {buffer = true}},
}

M.prose = function()
  for _, map in ipairs(M.maps) do
    vim.keymap.set(unpack(map))
  end
  vim.wo.spell = true
  vim.bo.spelllang = 'en'
  vim.wo.wrap = true
  vim.wo.linebreak = true
end

M.code = function()
  for _, map in ipairs(M.maps) do
    vim.keymap.del(map[1], map[2], map[4])
  end
  vim.wo.spell = false
  vim.wo.wrap = false
end

M.set = function()
  vim.api.nvim_create_user_command('Prose', M.prose, {})
  vim.api.nvim_create_user_command('Code',  M.code,  {})
end

return M
