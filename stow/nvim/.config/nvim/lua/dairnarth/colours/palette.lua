local M = {}

M.colours = {
  greys = {
    dark0  = "#2d2525",
    dark1  = "#3d3231",
    dark2  = "#4d3e3c",
    dark3  = "#6c5752",
    dark4  = "#8c7068",
    grey   = "#ab897e",
    light4 = "#c09d91",
    light3 = "#d4b0a4",
    light2 = "#e9c3b7",
    light1 = "#fdd6c9",
    light0 = "#fdded3",
  },
  dark = {
    red    = "#a65249",
    orange = "#a26d64",
    yellow = "#97762e",
    green  = "#838650",
    cyan   = "#68876a",
    blue   = "#6d7e8c",
    purple = "#846275",
  },
  normal = {
    red    = '#eb5b4b',
    orange = '#dd855b',
    yellow = '#d0a63f',
    green  = '#b0bb39',
    cyan   = '#86b78e',
    blue   = '#8fa9ba',
    purple = '#c180a7',
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
      red           = p.normal.red,
      green         = p.normal.green,
      yellow        = p.normal.yellow,
      blue          = p.normal.blue,
      purple        = p.normal.purple,
      cyan          = p.normal.cyan,
      orange        = p.normal.orange,
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
      fg2           = p.greys.grey,
      fg1           = p.greys.light4,
      fg0           = p.greys.light3,
      red           = p.dark.red,
      green         = p.dark.green,
      yellow        = p.dark.yellow,
      blue          = p.dark.blue,
      purple        = p.dark.purple,
      cyan          = p.dark.cyan,
      orange        = p.dark.orange,
    }
  }

  return colours[contrast]
end

return M
