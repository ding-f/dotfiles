if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# Setup Rustup Environment
. "$HOME/.cargo/env"

# Run Hyprland After Login
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    dbus-run-session Hyprland
fi
