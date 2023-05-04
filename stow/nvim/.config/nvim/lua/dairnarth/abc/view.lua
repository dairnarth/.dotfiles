local M = {}

M.compile = function(file, name)
  local cmd = M.is_portrait(file.abc) and 'abcm2ps ' or 'abcm2ps -l '
  vim.fn.system(cmd .. '-O - "' .. file.abc ..'" | ps2pdf - "' .. (name or file.pdf) .. '"')
end

M.continuous_start = function()
  local config = require'dairnarth.abc'.config
  local file = M.get_file()
  M.compile(file)
  local viewjob = vim.fn.jobstart(config.viewer .. ' "' .. file.pdf .. '"')
  vim.api.nvim_create_augroup('abclua', {clear = false})
  vim.api.nvim_create_autocmd('BufWritePost', {
    buffer = file.buf,
    callback = function() M.compile(file) end
  })
  vim.api.nvim_create_autocmd({'VimLeave', 'BufDelete',}, {
    buffer = file.buf,
    callback = function() M.continuous_end(file, viewjob) end
  })
end

M.continuous_end = function(file, viewjob)
  vim.api.nvim_clear_autocmds({group = "abclua", buffer = file.buf})
  require'os'.remove(file.pdf)
  vim.fn.jobstop(viewjob)
end

M.compile_once = function()
  local file = M.get_file()
  require'os'.remove(file.pdf)
  M.compile(file, vim.fn.expand("%:p:r") .. '.pdf')
end

M.get_file = function()
  local file = {}
  file.abc = vim.fn.expand("%")
  file.buf = vim.api.nvim_get_current_buf()
  file.pdf = require'os'.tmpname()
  return file
end

M.is_portrait = function(abc)
  local perror = tonumber(vim.fn.system('abcm2ps -O /dev/null "'  .. abc .. '" 2>&1 | wc -l'))
  local lerror = tonumber(vim.fn.system('abcm2ps -lO /dev/null "' .. abc .. '" 2>&1 | wc -l'))
  if perror > lerror then
    return false
  else
    return true
  end
end

return M
