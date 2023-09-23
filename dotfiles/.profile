# Base directory for the script
DIR=$HOME/.alpine
DOT=$DIR/dotfiles

export WLR_DRM_DEVICES=/dev/dri/card1
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export DBUS_SESSION_BUS_ADDRESS=unix:path=${XDG_RUNTIME_DIR}/bus

export TERM=alacritty
export BROWSER=firefox

export MOZ_ENABLE_WAYLAND=1

export XDG_CURRENT_DESKTOP=sway
export VK_KHR_surface=wayland
export QT_QPA_PLATFORM=xcb

export LIBVA_DRIVER_NAME=radeonsi
export VDPAU_DRIVER=radeonsi
export MESA_LOADER_DRIVER_OVERRIDE=radeonsi

export RUSTFLAGS=-Ctarget-feature=-crt-static
export RUSTC_WRAPPER=sccache 

. "$HOME/.cargo/env"
