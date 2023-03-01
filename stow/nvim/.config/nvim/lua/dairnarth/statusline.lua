local statusline = {}

statusline.enclose = function(input)
  return "%{%v:lua.require('dairnarth.statusline')." .. input .. '%}'
end

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
  local padding = (' '):rep(gutterwidth - 1)
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
  local mode = modes[vim.api.nvim_get_mode().mode]
  if mode == '%#SLModeN#' and vim.bo.modified then
    return '%#SLModeMod#'
  else
    return mode
  end
end

statusline.language = function(hide)
  local lang = string.upper(vim.bo.filetype)
  local lsp  = vim.lsp.get_active_clients()

  hide = hide == nil and false or hide
  if next(lsp) == nil or hide then
    return lang
  end

  local lsps = ''
  for i = 1, #lsp do
    lsps = lsps .. '[' .. lsp[i].config.cmd[1] .. ']'
  end

  if #lsp > 1 then
    return '%#SLDim#[' .. lsps .. '] %#Statusline#' .. lang
  else
    return '%#SLDim#' .. lsps .. ' %#Statusline#' .. lang
  end
end

statusline.normal = function()
  return ''
    .. statusline.enclose('gutterpadding()')
    .. statusline.enclose('modecolour()')
    .. '■ '
    .. '%#Statusline#'
    .. '%t %<'
    .. '%#SLDimIt#'
    .. '%F'
    .. '%='
    .. statusline.enclose('language()')
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

statusline.special = function()
  return ''
    .. statusline.enclose('gutterpadding()')
    .. statusline.enclose('modecolour()')
    .. '■ '
    .. '%#Statusline#'
    .. '%t %<'
    .. '%='
    .. statusline.enclose('language("true")')
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


statusline.print = function()
  if vim.bo.buftype == '' then
    return statusline.normal()
  else
    return statusline.special()
  end
end

return statusline
