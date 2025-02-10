#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Installing various programs from brew"
echo "#############################"
echo ""

function brew_install_or_upgrade {
    if brew ls --versions "$1" >/dev/null; then
        HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade "$1"
    else
        HOMEBREW_NO_AUTO_UPDATE=1 brew install "$1"
    fi
}

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

echo "Install pnpm"
brew_install_or_upgrade pnpm

brew tap homebrew/cask-versions

echo "Install chrome"
brew install --no-quarantine --cask google-chrome

echo "Install firefox"
brew install --no-quarantine --cask firefox

echo "Install slack"
brew install --no-quarantine --cask slack

echo "Install insomnia"
brew install --no-quarantine --cask insomnia

echo "Install figma"
brew install --no-quarantine --cask figma

echo "Install clipy"
brew install --no-quarantine --cask clipy

echo "Install visual-studio-code"
brew install --no-quarantine --cask visual-studio-code

echo "Install zoom"
brew install --no-quarantine --cask zoom
