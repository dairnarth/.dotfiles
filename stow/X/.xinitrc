#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

wmdir="$HOME/.local/share/$1"
mkdir -p "$wmdir"

light -S 10
setxkbmap gb #-option "caps:swapescape"
xrandr --output HDMI-0 --auto --output DP-0 --auto --left-of HDMI-0 --output DP-2 --auto --right-of HDMI-0
xinput set-prop 'bcm5974' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'bcm5974' 'libinput Tapping Enabled' 1
nitrogen --restore &
picom &
unclutter --timeout 1 &
dwm-bar &
exec "$1" > "$wmdir/stdout.log" 2> "$wmdir/stderr.log"
