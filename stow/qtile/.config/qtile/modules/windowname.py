from libqtile import bar, hook, pangocffi
from libqtile.widget import base

class WindowName(base._TextBox):
    def __init__(self, width=bar.STRETCH, **config):
        base._TextBox.__init__(self, width=width, **config)

    def _configure(self, qtile, bar):
        base._TextBox._configure(self, qtile, bar)
        hook.subscribe.client_name_updated(self.hook_response)
        hook.subscribe.current_screen_change(self.hook_response)
        hook.subscribe.focus_change(self.hook_response)
        hook.subscribe.float_change(self.hook_response)

    def remove_hooks(self):
        hook.unsubscribe.client_name_updated(self.hook_response)
        hook.unsubscribe.current_screen_change(self.hook_response)
        hook.unsubscribe.focus_change(self.hook_response)
        hook.unsubscribe.float_change(self.hook_response)

    def hook_response(self, *args):
        w = self.bar.screen.group.current_window
        state = ""
        if w:
            if w.floating:
                state = "▪ "
            var = {}
            var["state"] = state
            var["name"] = pangocffi.markup_escape_text(self.name_sub(w.name))
            wm_class = w.get_wm_class()
            var["class"] = pangocffi.markup_escape_text(
                wm_class[0].upper() if wm_class else "")
            self.format = "{classcolour}{class}</span> {namecolour}{name}</span> {state}"
            if self.bar.screen == self.qtile.current_screen:
                var["classcolour"] = "<span color='#d0a63f'>"
                var["namecolour"]  = "<span color='#fdd6c9'>"
            else:
                var["classcolour"] = "<span color='#97762e'>"
                var["namecolour"]  = "<span color='#c09d91'>"

            text = self.format.format(**var)
        else:
            text = ""
        self.update(text)

    def name_sub(self, text):
        for string in [" - qutebrowser", " — Mozilla Firefox"]:
           text = text.replace(string, "")
        return text

    def finalize(self):
        self.remove_hooks()
        base._TextBox.finalize(self)
