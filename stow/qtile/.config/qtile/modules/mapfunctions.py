from libqtile.lazy import lazy
from libqtile.log_utils import logger
from pprint import pprint

def get_win(q, program):
    for win in q.cmd_windows():
        for name in win['wm_class']:
            if name == program:
                return win
    return False

def raise_or_spawn(command):
    def _inner(q):
        program = command[0]
        win = get_win(q, program)
        if not win:
            q.cmd_spawn(command)
            return

        if win['group'] != q.current_group.name:
            q.current_screen.cmd_toggle_group(win['group'])

        if win['id'] != q.current_window.wid:
            q.current_group.cmd_focus_by_name(win['name'])

    return _inner

def reset():
    def _inner(q):
        for screen in q.screens:
            if screen.index + 1 != screen.group.name:
                screen.cmd_toggle_group(screen.index + 1)

    return _inner

def makefloat():
    def _inner(w):
        if w.floating:
            w.cmd_disable_floating()
        else:
            width = w.width
            height = w.height
            w.cmd_enable_floating()
            w.cmd_set_size_floating(width - 2, height - 2)

    return _inner
