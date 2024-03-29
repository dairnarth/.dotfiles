-- init.lua

require('dairnarth.mappings').set()
require('dairnarth.commands').set()
vim.cmd.colorscheme('colours')

-- Auto-installs folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("dairnarth.plugins", {
  ui = {
    border = 'rounded'
  }
})
