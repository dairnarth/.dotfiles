import os
from libqtile import bar, widget
from modules.windowname import WindowName

def init_bar(active=False):
    widgets = [
        widget.CurrentLayoutIcon(custom_icon_paths = ["/home/dch/.config/qtile/icons"]),
        widget.TextBox(" "),
        widget.AGroupBox(
            borderwidth=0,
        ),
        widget.TextBox(" "),
        WindowName(),
    ]

    if active:
        widgets.extend([
            widget.Systray(),
            widget.Clock(format=" %y%m%d %H%M%S"),
        ])
        if os.path.exists("/sys/class/power_supply/BAT0/capacity"):
            widgets.append(widget.Battery(format=" {percent:3.0}"))

    return bar.Bar(widgets, 16)
