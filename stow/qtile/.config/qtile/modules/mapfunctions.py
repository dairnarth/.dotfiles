from libqtile import bar

def raise_or_spawn(command):
    def get_win(q, program):
        for win in q.cmd_windows():
            for name in win['wm_class']:
                if name == program:
                    return win
        return False

    def _inner(q):
        win = get_win(q, command[0])
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

def toggle_all_bars():
    def _inner(q):
        is_show = None
        for screen in q.screens:
            for b in [screen.left, screen.right, screen.top, screen.bottom]:
                if isinstance(b, bar.Bar):
                    if is_show is None:
                        is_show = not b.is_show()
                        break

        if is_show is None:
            return

        for screen in q.screens:
            for b in [screen.left, screen.right, screen.top, screen.bottom]:
                if isinstance(b, bar.Bar):
                    b.show(is_show)

        q.groups.layout_all()

    return _inner
