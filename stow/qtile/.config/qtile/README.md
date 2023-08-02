# dairnarth/.dotfiles/qtile

Simple Qtile configuration with a couple of custom modules.

## Modules

### AutoTile

A simple implementation of RatioTile (1:1, instead of being able to choose), but with the ability to add overrides if you prefer a different layout for a specific number of windows; and, crucially, the movement and window spawning function the same way as the other default layouts (as opposed to backwards in RatioTile).

### Map Functions

| Function           | Description                                                                                        |
|--------------------|----------------------------------------------------------------------------------------------------|
| `makefloat`        | Toggles floating for a window while resizing it to allow for a change in border size.              |
| `raise_or_spawn`   | If the program is currently running, switch to it; otherwise, spawn the program.                   |
| `reset`            | Return all screens to the group that corresponds to their screen number.                           |
| `rotate_to_screen` | Allows passing windows between screens directly instead of having to work out the correct group. |
| `toggle_all_bars`  | Toggles the bar on all screens at once.                                                            |

### WindowName

A slight edit to the built in `windowname` bar module that shows the window class in uppercase and yellow as well as window name normally.
