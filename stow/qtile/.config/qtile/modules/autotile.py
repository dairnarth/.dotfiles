from libqtile.layout.base import _SimpleLayoutBase
from libqtile.log_utils import logger
from libqtile.config import Group, Match, Screen
from pprint import pprint
from math import sqrt, floor, ceil
from itertools import repeat

overrides = {
    3: [(0, 0, 1/2, 1), (1/2, 0, 1/2, 1/2), (1/2, 1/2, 1/2, 1/2)],
    8: [(0, 0, 1/3, 1/3), (1/3, 0, 1/3, 1/3), (2/3, 0, 1/3, 1/3),
        (0, 1/3, 1/3, 1/3), (1/3, 1/3, 1/3, 1/3), (2/3, 1/3, 1/3, 1/3),
        (0, 2/3, 1/2, 1/3), (1/2, 2/3, 1/2, 1/3)],
}

class AutoTile(_SimpleLayoutBase):
    """Tiles windows using set layouts for each number of windows"""

    defaults = [
        ("border_focus",  "#ff0000", "Border colour(s) for the focused window."),
        ("border_normal", "#000000", "Border colour(s) for the un-focused windows."),
        ("border_width",  1,         "Border width."),
        ("margin",        0,         "Margin of the layout (int or list of ints [N E S W])"),
        ("overrides",     overrides, "default: Overrides layout for 3 and 8 windows;\n" +
                                     "False: Does not override layout for 3 and 8 windows;\n" +
                                     "{dict}: Pass in custom overrides in the form `{n: [(x, y, w, h),...],...}`"),
    ]

    def __init__(self, **config):
        _SimpleLayoutBase.__init__(self, **config)
        self.add_defaults(AutoTile.defaults)
        self.recalc = True
        self.layout_info = []
        self.last_size = None
        self.last_screen = None
        if type(self.overrides) is not dict:
            self.overrides = {}


    def clone(self, group):
        return _SimpleLayoutBase.clone(self, group)

    def add(self, w):
        print('add')
        self.recalc = True
        self.clients.append(w)
    def remove(self, w):
        self.recalc = True
        return _SimpleLayoutBase.remove(self, w)

    def get_layout(self, screen, n):
        do = ((screen.width, screen.x),
              (screen.height, screen.y),
              (screen.width, 0),
              (screen.height, 0))

        try:
            wins = self.overrides[n]
        except KeyError:
            r  = sqrt(n)
            rl, rh = floor(r), ceil(r)
            rows = list(repeat(rh, rl))

            i, j = 0, -1
            while sum(rows) > n:
                if rows[i] == rows[i+1]:
                    rows[i] = rows[i] - 1
                else:
                    i += 1
            while sum(rows) < n:
                try:
                    if rows[j] == rows[j-1]:
                        rows[j] = rows[j] + 1
                    else:
                        j -= 1
                except IndexError:
                    rows[0] += 1
                    j = -1

            wins, i = [], 0
            l = len(rows)
            for row in rows:
                for j in range(row):
                    wins.append((j/row, i/l, 1/row, 1/l))
                i += 1

        out = []
        for win in wins:
            out.append(list((d * l) + o for l, (d, o) in zip(win, do)))
        return out

    def configure(self, win, screen):
        if not self.last_screen or self.last_screen != screen:
            self.last_screen = screen
            self.recalc = True
        if self.last_size and not self.dirty:
            if screen.width != self.last_size[0] or screen.height != self.last_size[1]:
                self.recalc = True
        if self.recalc == True:
            self.layout_info = self.get_layout(screen, len(self.clients))
            self.recalc = False
        try:
            index = self.clients.index(win)
        except ValueError:
            win.hide()
            return
        x, y, w, h = self.layout_info[index]

        if win.has_focus:
            bc = self.border_focus
        else:
            bc = self.border_normal
        win.place(
            int(x),
            int(y),
            int(w) - self.border_width * 2,
            int(h) - self.border_width * 2,
            self.border_width,
            bc,
            margin=self.margin,
        )
        win.unhide()

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
