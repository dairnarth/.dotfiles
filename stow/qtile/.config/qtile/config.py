# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import layout
from libqtile.config import Group, Match, Screen
from mappings import init_map
from barconfig import init_bar
from modules.autotile import AutoTile

class programs:
    class term:
        default   = ["kitty", "tmux-default"]
        kitty     = ["kitty"]
        alacritty = ["alacritty"]
        st        = ["st"]
    class browser:
        default   = ["qutebrowser"]
        private   = ["qutebrowser", "--target", "private-window"]
        firefox   = ["firefox"]
        youtube   = ["firefox", "--kiosk", "youtube.com"]
        jellyfin  = ["firefox", "--kiosk", "jellyfin.dylancairns.co.uk"]
        netflix   = ["firefox", "--kiosk", "netflix.com"]
    class music:
        default   = ["cider"]
        playpause = ["playerctl", "--player=cider,%any", "play-pause"]
        next      = ["playerctl", "--player=cider,%any", "next"]
        previous  = ["playerctl", "--player=cider,%any", "previous"]

groups = [Group(i) for i in "123456789"]
groups[0].spawn = " ".join(programs.term.default)
groups[1].spawn = " ".join(programs.browser.default)
groups[2].spawn = " ".join(programs.music.default)

keys, mouse = init_map(groups, programs)

layouts = [
    AutoTile(
        border_width = 0,
    ),
    layout.Max(),
]

widget_defaults = dict(
    font="Anonymous Pro",
    fontsize=14,
    padding=0,
    background="#2d2525",
    foreground="#fdd6c9"
)
extension_defaults = widget_defaults.copy()

screens = [Screen(top=init_bar(True))] + [Screen(top=init_bar()) for _ in groups]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
floating_layout = layout.Floating(
    float_rules=[
        Match(wm_type="utility"),
        Match(wm_type="notification"),
        Match(wm_type="toolbar"),
        Match(wm_type="splash"),
        Match(wm_type="dialog"),
        Match(wm_class="file_progress"),
        Match(wm_class="confirm"),
        Match(wm_class="dialog"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_class="notification"),
        Match(wm_class="splash"),
        Match(wm_class="toolbar"),
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_focus  = "#fdd6c9",
    border_normal = "#ab897e",
)
auto_fullscreen = False
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
