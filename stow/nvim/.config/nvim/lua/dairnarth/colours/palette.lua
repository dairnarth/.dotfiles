local M = {}

M.colours = {
  greys = {
    dark0  = "#282828",
    dark1  = "#3c3836",
    dark2  = "#504945",
    dark3  = "#665c54",
    dark4  = "#7c6f64",
    grey   = "#928374",
    light4 = "#a89984",
    light3 = "#bdae93",
    light2 = "#d5c4a1",
    light1 = "#ebdbb2",
    light0 = "#fbf1c7",
  },
  dark = {
    red    = '#9d0006',
    orange = '#af3a03',
    yellow = '#b57614',
    green  = '#79740e',
    cyan   = '#427b58',
    blue   = '#076678',
    purple = '#8f3f71',
  },
  normal = {
    red    = '#cc241d',
    orange = '#d65d0e',
    yellow = '#d79921',
    green  = '#98971a',
    cyan   = '#689d6a',
    blue   = '#458588',
    purple = '#b16286',
  },
  bright = {
    red    = '#fb4934',
    orange = '#fe8019',
    yellow = '#fabd2f',
    green  = '#b8bb26',
    cyan   = '#8ec07c',
    blue   = '#83a598',
    purple = '#d3869b',
  }
}

M.get_colours = function(contrast)
  local p = M.colours

  local colours = {
    normal = {
      bg0           = p.greys.dark0,
      bg1           = p.greys.dark1,
      bg2           = p.greys.dark2,
      bg3           = p.greys.dark3,
      bg4           = p.greys.dark4,
      grey          = p.greys.grey,
      fg4           = p.greys.light4,
      fg3           = p.greys.light3,
      fg2           = p.greys.light2,
      fg1           = p.greys.light1,
      fg0           = p.greys.light0,
      red           = p.bright.red,
      green         = p.bright.green,
      yellow        = p.bright.yellow,
      blue          = p.bright.blue,
      purple        = p.bright.purple,
      cyan          = p.bright.cyan,
      orange        = p.bright.orange,
      normal_red    = p.normal.red,
      normal_green  = p.normal.green,
      normal_yellow = p.normal.yellow,
      normal_blue   = p.normal.blue,
      normal_purple = p.normal.purple,
      normal_cyan   = p.normal.cyan,
    },
    dim = {
      bg0           = p.greys.dark0,
      bg1           = p.greys.dark1,
      bg2           = p.greys.dark1,
      bg3           = p.greys.dark1,
      bg4           = p.greys.dark2,
      grey          = p.greys.dark3,
      fg4           = p.greys.dark4,
      fg3           = p.greys.grey,
      fg2           = p.greys.light4,
      fg1           = p.greys.light3,
      fg0           = p.greys.light2,
      red           = p.normal.red,
      green         = p.normal.green,
      yellow        = p.normal.yellow,
      blue          = p.normal.blue,
      purple        = p.normal.purple,
      cyan          = p.normal.cyan,
      orange        = p.normal.orange,
      normal_red    = p.dark.red,
      normal_green  = p.dark.green,
      normal_yellow = p.dark.yellow,
      normal_blue   = p.dark.blue,
      normal_purple = p.dark.purple,
      normal_cyan   = p.dark.cyan,
    }
  }

  return colours[contrast]
end

return M
