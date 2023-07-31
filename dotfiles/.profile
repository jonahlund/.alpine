# Base directory for the script
DIR=$HOME/.alpine
DOT=$DIR/dotfiles

# Profile
if test -z "${XDG_RUNTIME_DIR}"; then
	export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
	if ! test -d "${XDG_RUNTIME_DIR}"; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

# Link dotfiles
mkdir -p ~/.config
# Sway
rm -rf ~/.config/sway
ln -sf $DOT/sway ~/.config/sway
# Alacritty
rm -rf ~/.config/alacritty
ln -sf $DOT/alacritty ~/.config/alacritty
# Neovim
rm -rf ~/.config/nvim
ln -sf $DOT/nvim ~/.config/nvim
# Ncspot
rm -rf ~/.config/ncspot
ln -sf $DOT/ncspot ~/.config/ncspot
# Tms
rm -rf ~/.config/tms
ln -sf $DOT/tms ~/.config/tms
# Dotfiles
ln -sf $DOT/.tmux.conf ~/.tmux.conf
ln -sf $DOT/.gitconfig ~/.gitconfig
ln -sf $DOT/.profile ~/.profile

# Default applications
export TERM=alacritty
export BROWSER=firefox

export MOZ_ENABLE_WAYLAND=1

export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORM="wayland-egl"

export LIBVA_DRIVER_NAME=radeonsi
export VDPAU_DRIVER=radeonsi
export MESA_LOADER_DRIVER_OVERRIDE=radeonsi

export RUSTFLAGS=-Ctarget-feature=-crt-static

. "$HOME/.cargo/env"
