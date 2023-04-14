from libqtile.layout.base import _SimpleLayoutBase
from libqtile.layout.ratiotile import GridInfo, GOLDEN_RATIO

class SaneRatioTile(_SimpleLayoutBase):
    """Tries to tile all windows in the width/height ratio passed in"""

    defaults = [
        ("border_focus", "#0000ff", "Border colour(s) for the focused window."),
        ("border_normal", "#000000", "Border colour(s) for un-focused windows."),
        ("border_width", 1, "Border width."),
        ("margin", 0, "Margin of the layout (int or list of ints [N E S W])"),
        ("ratio", GOLDEN_RATIO, "Ratio of the tiles"),
        ("ratio_increment", 0.1, "Amount to increment per ratio increment"),
        ("fancy", False, "Use a different method to calculate window sizes."),
    ]

    def __init__(self, **config):
        _SimpleLayoutBase.__init__(self, **config)
        self.add_defaults(SaneRatioTile.defaults)
        self.dirty = True  # need to recalculate
        self.layout_info = []
        self.last_size = None
        self.last_screen = None

    def clone(self, group):
        return _SimpleLayoutBase.clone(self, group)

    def add(self, w):
        self.dirty = True
        self.clients.append(w)
    def remove(self, w):
        self.dirty = True
        return _SimpleLayoutBase.remove(self, w)

    def configure(self, win, screen):
        # force recalc
        if not self.last_screen or self.last_screen != screen:
            self.last_screen = screen
            self.dirty = True
        if self.last_size and not self.dirty:
            if screen.width != self.last_size[0] or screen.height != self.last_size[1]:
                self.dirty = True
        if self.dirty:
            gi = GridInfo(self.ratio, len(self.clients), screen.width, screen.height)
            self.last_size = (screen.width, screen.height)
            if self.fancy:
                method = gi.get_sizes_advanced
            else:
                method = gi.get_sizes

            self.layout_info = method(screen.width, screen.height, screen.x, screen.y)

            self.dirty = False
        try:
            idx = self.clients.index(win)
        except ValueError:
            win.hide()
            return
        x, y, w, h = self.layout_info[idx]
        if win.has_focus:
            bc = self.border_focus
        else:
            bc = self.border_normal
        win.place(
            x,
            y,
            w - self.border_width * 2,
            h - self.border_width * 2,
            self.border_width,
            bc,
            margin=self.margin,
        )
        win.unhide()

    def info(self):
        d = _SimpleLayoutBase.info(self)
        focused = self.clients.current_client
        d["ratio"] = self.ratio
        d["focused"] = focused.name if focused else None
        d["layout_info"] = self.layout_info
        return d

    cmd_down = _SimpleLayoutBase.next
    cmd_up = _SimpleLayoutBase.previous

    cmd_previous = _SimpleLayoutBase.previous
    cmd_next = _SimpleLayoutBase.next

    def cmd_shuffle_down(self):
        if self.clients:
            self.clients.rotate_down()
            self.group.layout_all()

    def cmd_shuffle_up(self):
        if self.clients:
            self.clients.rotate_up()
            self.group.layout_all()

    def cmd_decrease_ratio(self):
        new_ratio = self.ratio - self.ratio_increment
        if new_ratio < 0:
            return
        self.ratio = new_ratio
        self.group.layout_all()

    def cmd_increase_ratio(self):
        self.ratio += self.ratio_increment
        self.group.layout_all()
