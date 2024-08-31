#!/bin/sh

DIR=$( dirname -- "$( readlink -f -- "$0"; )"; )

### Install development packages
echo "Installing development packages..."
sudo apk add build-base openssl-dev fontconfig-dev bash curl wget libxkbcommon-dev libxkbfile-dev

### Install and configure graphic drivers
#
# This is configured for AMD chipsets
#
# For Intel: https://wiki.alpinelinux.org/wiki/Intel_Video
# For AMD/Radeon: https://wiki.alpinelinux.org/wiki/Radeon_Video
# For NVIDIA: https://wiki.alpinelinux.org/wiki/NVIDIA
echo "Installing graphics..."
sudo apk add linux-firmware-amdgpu mesa-dev mesa-dri-gallium mesa-va-gallium mesa-vulkan-ati
# Append our kernel modules to /etc/modules
# Edit these to your chipset
echo amdgpu | sudo tee -a /etc/modules
echo fbcon | sudo tee -a /etc/modules

### Install pipewire
echo "Installing pipewire..."
sudo apk add pipewire pipewire-tools pipewire-spa-tools pipewire-pulse pipewire-spa-vulkan
sudo apk add wireplumber wireplumber-logind

### Install xdg
echo "Installing xdg..."
sudo apk add xdg-user-dirs xdg-desktop-portal xdg-desktop-portal-wlr
xdg-user-dirs-update

### Install sway
echo "Installing sway..."
sudo apk add wlroots wayland xwayland wl-clipboard
sudo apk add sway swaylock swaybg swayidle

### Install rust
echo "Installing rust..."
sudo apk add rustup sccache
rustup-init -y --default-toolchain nightly
. "$HOME/.cargo/env"
# (optional) Install rust-analyzer
rustup component add rust-analyzer
ln -sf $HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-musl/bin/rust-analyzer $HOME/.cargo/bin/rust-analyzer

### Install fonts
#
# Add your preferred fonts here
echo "Installing fonts..."
sudo apk add font-jetbrains-mono-nerd
fc-cache -fv

### Install cargo binaries
#
# Add your favorite rust binaries here
echo "Installing cargo binaries..."
cargo install workstyle kickoff

### Install user applications
#
# Add your preferred applications here, vim, firefox etc.
echo "Installing user applications..."
sudo apk add librewolf alacritty grimshot mpv imv taplo

### Install DBus
#
# DBus is a message bus system that provides a mechanism for inter-process communication.
#
# Some services rely on a D-Bus session instance or expect it by default (including Pipewire).
# Other processes will only be able to communicate with these services if d-bus is running. 
echo "Installing DBus..."
sudo apk add dbus dbus-openrc
sudo rc-update add dbus default
sudo dbus-uuidgen --ensure

### Install seatd
#
# seatd is a minimal seat management daemon that
# - takes care of mediating access to shared devices (graphics, input)
# - setting up necessary permissions for the desktop environment or window manager
echo "Installing seatd..."
sudo apk add seatd seatd-launch seatd-openrc
sudo rc-update add seatd default

### Install greetd
#
# greetd acts as a system service that manages user sessions and provides a way for users
# to log into their system or start new sessions.
echo "Installing greetd..."
sudo apk add greetd greetd-openrc greetd-agreety
sudo rc-update add greetd default
# Copy our greetd configuration
sudo rm -rf /etc/greetd
sudo cp -f -R $DIR/greetd /etc/greetd
sudo chmod -R go+r /etc/greetd
# Ensure greeter permissions
sudo addgroup greetd input
