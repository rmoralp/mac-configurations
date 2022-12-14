#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Installing extensions VSCode extensions"
echo "#############################"
echo ""

ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config/vscode"

echo "Install VS Code extensions"
< "./$CONFIG_DIR/extensions.txt" xargs -L 1 code --install-extension
