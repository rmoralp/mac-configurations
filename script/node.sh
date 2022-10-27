#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Running global npm setup from npm.sh"
echo "#############################"
echo ""

ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

LATEST_NVM_TAG=$(get_latest_release "nvm-sh/nvm")

echo "Install NVM ($LATEST_NVM_TAG)"
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$LATEST_NVM_TAG/install.sh" | bash

# loading nvm for now
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

echo "Install Node LTS"
nvm install --lts
nvm alias default lts/*
nvm use default
