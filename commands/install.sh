#!/usr/bin/env sh

# get current location
ROOT_DIR=$PWD
CONFIG_DIR="$ROOT_DIR/config"
SCRIPT_DIR="$ROOT_DIR/script"

source "$ROOT_DIR/commands/_utils.sh"

echo "Running commands/install.sh..."

bash "$SCRIPT_DIR/mac.sh" "$ROOT_DIR"

# *************************************
# oh-my-zsh
#
log_section_start "Installing oh-my-zsh"

if [ -d ~/.oh-my-zsh/ ]; then
  echo "Cleaning up ~/.oh-my-zsh/"
  rm -rf ~/.oh-my-zsh/
fi

RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# *************************************
# Other scripts
bash "$SCRIPT_DIR/brew.sh" "$ROOT_DIR"
bash "$SCRIPT_DIR/node.sh" "$ROOT_DIR"
bash "$SCRIPT_DIR/vscode.sh" "$ROOT_DIR"

# *************************************
# End
#
echo "Everything is done!"
