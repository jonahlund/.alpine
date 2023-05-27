# Profile
if test -z "${XDG_RUNTIME_DIR}"; then
	export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
	if ! test -d "${XDG_RUNTIME_DIR}"; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

# Default applications
export TERM=alacritty
export BROWSER=firefox

export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1

export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORM="wayland-egl"

export MESA_LOADER_DRIVER_OVERRIDE=radeonsi
export LIBVA_DRIVER_NAME=radeonsi

export RUSTFLAGS=-Ctarget-feature=-crt-static

. "$HOME/.cargo/env"
