#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Installing various programs from brew"
echo "#############################"
echo ""

ROOT_DIR=$1
source "$ROOT_DIR/commands/__util.sh"

echo "Install Brew"
brew -v >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Update zsh
echo "Install zsh"
brew_install_or_upgrade zsh

# set zsh as default shell
chsh -s /bin/zsh

# Install brew packages
echo "Install git"
brew_install_or_upgrade git

echo "Install git-extras"
brew_install_or_upgrade git-extras

echo "Install curl"
brew_install_or_upgrade curl

echo "Install docker"
brew_install_or_upgrade docker