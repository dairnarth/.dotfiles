return function()
  return vim.v.folddashes:gsub('-', '›')
      .. '·«'
      .. (vim.v.foldend - vim.v.foldstart + 1)
      .. 'ℓ»·«'
      .. vim.api.nvim_buf_get_lines(0, vim.v.foldstart - 1, vim.v.foldstart, true)[1]:gsub(' *', '', 1)
      .. '»'
end
