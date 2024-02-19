export VDPAU_DRIVER=radeonsi
export MESA_LOADER_DRIVER_OVERRIDE=radeonsi

export TERM=alacritty
export BROWSER=firefox

export RUSTFLAGS=-Ctarget-feature=-crt-static
export RUSTC_WRAPPER=sccache 
export HELIX_RUNTIME=/usr/share/helix/runtime

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export PATH="$HOME/.yarn/bin:$PATH"

. "$HOME/.cargo/env"
