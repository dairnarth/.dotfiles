local colours = {}

colours.palette = {
  black        = '#282828',
  dark_grey    = '#7c6f64',
  grey         = '#928374',
  light_grey   = '#a89984',
  white        = '#ebdbb2',
  dark_red     = '#9d0006',
  red          = '#cc241d',
  light_red    = '#fb4934',
  dark_orange  = '#af3a03',
  orange       = '#d65d0e',
  light_orange = '#fe8019',
  dark_yellow  = '#b57614',
  yellow       = '#d79921',
  light_yellow = '#fabd2f',
  dark_green   = '#79740e',
  green        = '#98971a',
  light_green  = '#b8bb26',
  dark_cyan    = '#427b58',
  cyan         = '#689d6a',
  light_cyan   = '#8ec07c',
  dark_blue    = '#076678',
  blue         = '#458588',
  light_blue   = '#83a598',
  dark_purple  = '#8f3f71',
  purple       = '#b16286',
  light_purple = '#d3869b',
}

local p = colours.palette
colours.highlight = function()
  vim.cmd.highlight({'ErrorMsg',  'guifg=' .. p.light_red,    'guibg=' .. p.black, 'gui=bold'})
  vim.cmd.highlight({'Search',    'guifg=' .. p.light_yellow, 'guibg=' .. p.black, 'gui=bold,italic,underline', 'cterm=none'})
  vim.cmd.highlight({'IncSearch', 'guifg=' .. p.light_yellow, 'guibg=' .. p.black, 'gui=bold,italic,reverse',   'cterm=none'})
  vim.cmd.highlight({'Pmenu',     'guifg=' .. p.white,        'guibg=' .. p.black, 'gui=none'})
end

return colours
