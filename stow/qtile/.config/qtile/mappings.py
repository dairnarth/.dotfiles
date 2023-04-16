from libqtile.config import Click, Drag, Key as K, KeyChord as KC
from libqtile.lazy import lazy as l
from modules import mapfunctions as m

mod = "mod4"

def group_maps(groups):
    keys = []
    for g in groups:
        keys.extend([
            K([mod],            g.name, l.group[g.name].toscreen()),
            K([mod, "shift"],   g.name, l.window.togroup(g.name)),
            K([mod, "control"], g.name, l.window.togroup(g.name, switch_group=True)),
        ])
    return keys

def movement_maps():
    keys = [
        K([mod],          "j", l.layout.down()),
        K([mod],          "k", l.layout.up()),
        K([mod],          "h", l.next_screen()),
        K([mod],          "l", l.prev_screen()),

        K([mod, "shift"], "j", l.layout.shuffle_down()),
        K([mod, "shift"], "k", l.layout.shuffle_up()),
        K([mod, "shift"], "h", l.window.toscreen(+1)), #TODO: Fix this
        K([mod, "shift"], "l", l.window.toscreen(-1)),
    ]
    return keys

def spawn_maps():
    volu = "XF86AudioRaiseVolume"
    vold = "XF86AudioLowerVolume"
    volm = "XF86AudioMute"
    brtu = "XF86MonBrightnessUp"
    brtd = "XF86MonBrightnessDown"

    return [
        K([mod],            "t",      l.function(m.raise_or_spawn(["kitty", "tmux-default"]))),
        K([mod],            "w",      l.function(m.raise_or_spawn(["qutebrowser"]))),
        KC([mod, "shift"],  "w",      [
            K([],           "w",      l.spawn("qutebrowser")),
            K([],           "s",      l.spawn("wm-scripts websearch")),
            K([],           "p",      l.spawn("qutebrowser --target private-window")),
            K([],           "f",      l.spawn("firefox")),
            K([],           "y",      l.spawn("firefox --kiosk youtube.com")),
            K([],           "j",      l.spawn("firefox --kiosk jellyfin.dylancairns.co.uk")),
            K([],           "n",      l.spawn("firefox --kiosk netflix.com")),
        ], name = "WebChord"),
        K([mod],            "space",  l.spawn("rofi -show")),

        K([],               volu,     l.spawn("wm-scripts volume -i 5")),
        K([],               vold,     l.spawn("wm-scripts volume -d 5")),
        K(["shift"],        volu,     l.spawn("wm-scripts volume -i 1")),
        K(["shift"],        vold,     l.spawn("wm-scripts volume -d 1")),
        K([],               volm,     l.spawn("wm-scripts volume -t")),
        K([],               brtu,     l.spawn("wm-scripts brightness s 1+")),
        K([],               brtd,     l.spawn("wm-scripts brightness s 1-")),
    ]

def window_maps():
    return [
        K([mod],            "b",      l.hide_show_bar()),
        K([mod],            "f",      l.window.function(m.makefloat())),
        K([mod],            "q",      l.window.kill()),
        K([mod],            "return", l.next_layout()),
        K([mod, "shift"],   "Escape", l.function(m.reset())),
        K([mod, "shift"],   "x",      l.spawn("wm-scripts shutdown")),
        K([mod, "shift"],   "q",      l.shutdown()),
        K([mod, "shift"],   "r",      l.restart()),
        K([mod, "control"], "r",      l.reload_config()),
    ]

def init_map(groups):
    keys = group_maps(groups)
    keys.extend(movement_maps())
    keys.extend(spawn_maps())
    keys.extend(window_maps())

    mouse = [
        Drag( [mod], "Button1", l.window.set_position_floating(), start=l.window.get_position()),
        Drag( [mod], "Button3", l.window.set_size_floating(),     start=l.window.get_size()),
        Click([mod], "Button2", l.window.bring_to_front()),
    ]

    return keys, mouse
