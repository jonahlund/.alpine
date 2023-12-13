if test -z "${XDG_RUNTIME_DIR}"; then
	export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
	if ! test -d "${XDG_RUNTIME_DIR}"; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

export WLR_DRM_DEVICES=/dev/dri/card1

export TERM=alacritty
export BROWSER=firefox

export MOZ_ENABLE_WAYLAND=1

export XDG_CURRENT_DESKTOP=sway
export VK_KHR_surface=wayland
export QT_QPA_PLATFORM=xcb

export LIBVA_DRIVER_NAME=radeonsi
export VDPAU_DRIVER=radeonsi
export MESA_LOADER_DRIVER_OVERRIDE=radeonsi
export LD_PRELOAD=""

export RUSTC_WRAPPER=sccache 
export HELIX_RUNTIME=/usr/share/helix/runtime

export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

alias sway='exec dbus-launch --exit-with-session sway'
alias steam='flatpak run --user com.valvesoftware.Steam'
