# dairnarth/.dotfiles/nvim

## Installation

```
git clone https://github.com/dairnarth/.dotfiles

# With `stow` installed
.dotfiles/dot -i nvim

# Without `stow` installed
cp .dotfiles/stow/nvim/.config/nvim ~/.config/
```

All plugins should install themselves the first time NeoVim launches.

## Features

  - Subtle global statusbar with `mode` and `modified` indicator;
  - Focus on the current window by dimming all others (see [gruvbox-dim](https://github.com/dairnarth/gruvbox-dim.nvim));
  - Opening vim with no arguments opens Telescope find/git files;
  - LSP auto-install ([mason](https://github.com/williamboman/mason.nvim) and treesitter highlighting/indenting/folding.

### Plugins

#### Colourschemes

  - [ellisonleao/gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)
  - [dairnarth/gruvbox-dim.nvim](https://github.com/dairnarth/gruvbox-dim.nvim)
  - [folke/styler.nvim](https://github.com/folke/styler.nvim)

#### Navigation

  - [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  - [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
  - [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)
  - [mbbill/undotree](https://github.com/mbbill/undotree)
  - [alexghergh/nvim-tmux-navigation](https://github.com/alexghergh/nvim-tmux-navigation)

#### LSPConfig

  - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  - [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
  - [folke/neodev.nvim](https://github.com/folke/neodev.nvim)
  - [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
  - [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
  - [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
  - [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
  - [uga-rosa/cmp-dictionary](https://github.com/uga-rosa/cmp-dictionary)

#### Treesitter

  - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - [nvim-treesitter/playground](https://github.com/nvim-treesitter/playground)

#### Filetype

  - [lervag/vimtex](https://github.com/lervag/vimtex)
  - [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

#### Misc

  - [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
  - [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
  - [godlygeek/tabular](https://github.com/godlygeek/tabular)
  - [m4xshen/smartcolumn.nvim](https://github.com/m4xshen/smartcolumn.nvim)
