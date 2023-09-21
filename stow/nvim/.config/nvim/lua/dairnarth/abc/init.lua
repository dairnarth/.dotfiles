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

M.get_visual = function()
  local mode = vim.fn.visualmode()
  local sel = {}
  _, sel.ls, sel.cs = unpack(vim.fn.getpos("v"))
  _, sel.le, sel.ce = unpack(vim.fn.getpos("."))
  if sel.ls > sel.le then sel.ls, sel.le = sel.le, sel.ls end
  if sel.cs > sel.ce then sel.cs, sel.ce = sel.ce, sel.cs end

  if mode == 'v' then
    sel.lines = vim.api.nvim_buf_get_text(0, sel.ls - 1, sel.cs - 1, sel.le - 1, sel.ce, {})
  elseif mode == 'V' then
    sel.lines = vim.api.nvim_buf_get_lines(0, sel.ls - 1, sel.le, true)
  elseif mode == '' then
    local lines = {}
    for l = sel.ls, sel.le do
      table.insert(lines, vim.api.nvim_buf_get_text(0, l - 1, sel.cs - 1, l - 1, sel.ce, {})[1])
    end
    sel.lines = lines
  else
    error('No previous visualmode.')
  end

  return sel
end

M.set_visual = function(sel)
  for l = sel.ls, sel.le do
    local oldline = vim.api.nvim_buf_get_lines(0, l - 1, l, true)[1]
    vim.api.nvim_buf_set_lines(
      0,
      l - 1,
      l,
      true,
      {oldline:sub(1, sel.cs - 1)
        .. sel.lines[l - sel.ls + 1]
        .. oldline:sub(sel.ce + 1)}
    )
  end
end

M.transpose = function(interval)
  if interval == nil then
    interval = tonumber(vim.fn.input("Interval to transpose: "))
    if type(interval) ~= 'number' then
      error("Interval should be a number.")
    end
  end

  local sel = M.get_visual()
  if not sel.lines[1]:match("^X.*") then
    sel.lines ={ "X:1", "M:none", "K:none", unpack(sel.lines)}
  end

  local temp = vim.fn.tempname()
  vim.fn.writefile(sel.lines, temp)
  local transposed = vim.fn.system({'abc2abc', temp, '-t', interval}):gsub('^.*K:[^\n]*\n', '', 1)
  vim.fn.delete(temp)

  local lines = {}
  for line in transposed:gmatch('[^\n]+') do
    table.insert(lines, line)
  end
  sel.lines = lines

  return M.set_visual(sel)
end

return M
