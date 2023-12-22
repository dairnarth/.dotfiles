import os
from libqtile import bar, widget
from modules.windowname import WindowName

def battery():
    def _inner():
        b = open('/sys/class/power_supply/BAT0/capacity', 'r').read().replace('\n', '').zfill(3)
        c = open('/sys/class/power_supply/BAT0/status', 'r').read().replace('\n', '')
        if c == 'Charging':
            return "<span color='#b0bb39'> {}</span>".format(b)
        elif int(b) <= 25:
            return "<span color='#eb5b4b'> {}</span>".format(b)
        else:
            return " {}".format(b)

    return _inner

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
            widgets.append(widget.GenPollText(
                               func=battery(),
                               update_interval=10,
                            )
            )

    return bar.Bar(widgets, 16)
