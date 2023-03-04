# dairnarth/.dotfiles

Configuration files for programs that I use, mostly [nvim](https://github.com/dairnarth/.dotfiles/tree/main/stow/nvim/.config/nvim) and [bash](https://github.com/dairnarth/.dotfiles/tree/main/stow/bash/.config/bash).

## Installation

To install all files:

```
git clone https://github.com/dairnarth/.dotfiles
.dotfiles/dot -i all
```

### Dependencies

  - [stow](https://www.gnu.org/software/stow/) (optional)

The easiest way to interact with this repository is the `dot` script, but you can use `stow` directly (with something like `cd .dotfiles/stow && stow -vt "$HOME" -S *`), or even a classic `mv`/`cp`.

## dot

`dot` is a wrapper around `stow` that performs some argument checks and creates some directories before `stow` is called.

| -f | --flag      | values              | desc.                                                         |
|----|-------------|---------------------|---------------------------------------------------------------|
| -i | --install   | package(s) or `all` | Installs symlinks from `.dotfiles/stow/package` to `~`.       |
| -u | --uninstall | package(s) or `all` | Removes symlinks from `.dotfiles/stow/package`.               |
| -r | --refresh   | package(s) or `all` | Removes then reinstalls the symlinks.                         |
| -l | --list      |                     | List all available packages. (Same as `ls -1 .dotfiles/stow`) |
| -h | --help      |                     | Shows this section of the README.md                           |
