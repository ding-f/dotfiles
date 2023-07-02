#!/usr/bin/env bash

$HOME/.screenlayout/workstation.sh
feh --bg-fill $HOME/.config/wallpaper.jpg
picom --animations --animation-for-open-window fly-in -b --experimental-backends
xrdb -merge $HOME/.Xresources
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
dunst &
dwmbar &

# Allows Reloading dwm
while :; do
	ssh-agent dwm
done
