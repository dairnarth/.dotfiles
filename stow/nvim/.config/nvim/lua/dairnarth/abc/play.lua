local M = function(chord)
  local config = require'dairnarth.abc'.config

  local file = {}
  file.abc = vim.fn.expand("%")
  file.cfg = require'os'.tmpname()
  file.mid = require'os'.tmpname()
  file.wav = require'os'.tmpname()

  local f, err = require'io'.open(file.cfg, 'w')
  if f == nil then
    print("Couldn't open file: " .. err)
  else
    f:write('player_tempo_int ' .. config.speed)
    f:close()
  end

  local charg = chord and '' or '-NGUI '

  vim.fn.system('abc2midi '
    .. '"' .. file.abc .. '" '
    .. charg
    .. '-o "' .. file.mid .. '"'
  )
  vim.fn.system('fluidsynth '
    .. '-f "' .. file.cfg .. '" '
    .. '-F "' .. file.wav .. '" '
    .. '"' .. file.mid .. '"'
  )
  vim.fn.system(config.player .. ' "' .. file.wav .. '"')

  require'os'.remove(file.cfg)
  require'os'.remove(file.mid)
  require'os'.remove(file.wav)
end

return M
