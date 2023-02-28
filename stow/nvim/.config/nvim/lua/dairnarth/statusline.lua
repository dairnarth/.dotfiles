local statusline = {}

statusline.gutterpadding = function()
  local wins = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local pos = vim.api.nvim_win_get_position(win)
    if pos[2] == 0 then
      table.insert(wins, {win, pos[1]})
    end
  end
  table.sort(wins, function(a, b) return a[2] > b[2] end)

  local minwidth = 2
  local numberwidth = vim.wo.numberwidth
  local row = vim.api.nvim_buf_line_count(vim.api.nvim_win_get_buf(wins[1][1]))
  local gutterwidth = math.max((#tostring(row) + 1), minwidth, numberwidth)
  local padding = (' '):rep(gutterwidth - 2)
  return padding
end

statusline.modecolour = function()
  local modes = {
    ['n']     = '%#SLModeN#',
    ['no']    = '%#SLModeN#',
    ['nov']   = '%#SLModeN#',
    ['noV']   = '%#SLModeN#',
    ['no\22'] = '%#SLModeN#',
    ['niI']   = '%#SLModeN#',
    ['niR']   = '%#SLModeN#',
    ['niV']   = '%#SLModeN#',
    ['nt']    = '%#SLModeN#',
    ['ntT']   = '%#SLModeN#',
    ['v']     = '%#SLModeV#',
    ['vs']    = '%#SLModeV#',
    ['V']     = '%#SLModeV#',
    ['Vs']    = '%#SLModeV#',
    ['\22']   = '%#SLModeV#',
    ['\22s']  = '%#SLModeV#',
    ['s']     = '%#SLModeS#',
    ['S']     = '%#SLModeS#',
    ['\19']   = '%#SLModeS#',
    ['i']     = '%#SLModeI#',
    ['ic']    = '%#SLModeI#',
    ['ix']    = '%#SLModeI#',
    ['R']     = '%#SLModeR#',
    ['Rc']    = '%#SLModeR#',
    ['Rx']    = '%#SLModeR#',
    ['Rv']    = '%#SLModeV#',
    ['Rvc']   = '%#SLModeV#',
    ['Rvx']   = '%#SLModeV#',
    ['c']     = '%#SLModeC#',
    ['cv']    = '%#SLModeC#',
    ['ce']    = '%#SLModeC#',
    ['r']     = '%#SLModeR#',
    ['rm']    = '%#SLModeC#',
    ['r?']    = '%#SLModeC#',
    ['!']     = '%#SLModeT#',
    ['t']     = '%#SLModeT#',
  }
  return modes[vim.api.nvim_get_mode().mode]
end

statusline.language = function()
  local lsp = vim.lsp.get_active_clients({bufnr = 0})
  if next(lsp) == nil  then
    return '%y'
  else
    return '[' .. vim.inspect(lsp[1].config.cmd[1]):gsub('"', '')  .. ']'
  end
end

statusline.set = function()
  vim.o.statusline = statusline.modecolour()
                  .. statusline.gutterpadding()
                  .. '■ '
                  .. '%#Statusline#'
                  .. '%t %<'
                  .. '%#SLDimIt#'
                  .. '%F'
                  .. '%='
                  .. '%#SLDim#'
                  .. statusline.language()
                  .. '%#SLIt#'
                  .. ' %2l'
                  .. '%#Statusline#'
                  .. 'ℓ '
                  .. '%#SLIt#'
                  .. '%2v'
                  .. '%#Statusline#'
                  .. '𝒸 '
                  .. '%3.3p%%'
end

return statusline
