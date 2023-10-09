#!/usr/bin/env bash

xrandr --output DisplayPort-0 --primary --mode 2560x1440 --pos 1080x790 --rotate normal --rate 165 --output DisplayPort-1 --off --output DisplayPort-2 --off --output HDMI-A-0 --mode 2560x1080 --pos 0x0 --rotate left --rate 60 &
xrdb -merge $HOME/.Xresources &
xsetroot -cursor_name left_ptr &
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
picom --animations --animation-for-open-window fly-in -b &
dunst &
nitrogen --restore &
exec bspwm
