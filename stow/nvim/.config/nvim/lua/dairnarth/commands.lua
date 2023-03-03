local commands = {}

commands.maps = {
  {'i', '.', '.<C-G>u', {buffer = true}},
  {'i', ',', ',<C-G>u', {buffer = true}},
  {'i', '!', '!<C-G>u', {buffer = true}},
  {'i', '?', '?<C-G>u', {buffer = true}},
  {'i', ':', ':<C-G>u', {buffer = true}},
  {'i', ';', ';<C-G>u', {buffer = true}},
}

commands.prose = function()
  for _, map in ipairs(commands.maps) do
    vim.keymap.set(unpack(map))
  end
  vim.wo.spell = true
  vim.bo.spelllang = 'en'
  vim.wo.wrap = true
  vim.wo.linebreak = true
end

commands.code = function()
  for _, map in ipairs(commands.maps) do
    vim.keymap.del(map[1], map[2], map[4])
  end
  vim.wo.spell = false
  vim.wo.wrap = false
end

commands.set = function()
  vim.api.nvim_create_user_command('Prose', commands.prose, {})
  vim.api.nvim_create_user_command('Code',  commands.code,  {})
end

return commands
