#!/bin/sh

set -e
sudo setup-devd udev

DIR=$( dirname -- "$( readlink -f -- "$0"; )"; )

# Ensure environment variables are set before installation
. $DIR/dotfiles/.profile

# Install
sh $DIR/install.sh

# Link dotfiles
mkdir -p $HOME/.config
sh $DIR/link-dotfiles.sh

echo "Installation completed!"
echo "Please reboot."
