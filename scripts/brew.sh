#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Installing various programs from brew"
echo "#############################"
echo ""

ROOT_DIR=$1
source "$ROOT_DIR/commands/__util.sh"

brew -v >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Update zsh
brew_install_or_upgrade zsh

# set zsh as default shell
chsh -s /bin/zsh

# Install brew packages
brew_install_or_upgrade git
brew_install_or_upgrade git-extras
brew_install_or_upgrade curl
brew_install_or_upgrade docker