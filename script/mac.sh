#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Setting global mac configs from mac.sh"
echo "#############################"
echo ""

echo "show the ~/Library folder in Finder"
chflags nohidden ~/Library

echo "Enable Show remaining battery time;"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Stop iTunes from responding to the keyboard media keys"
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

echo "Remove delay when taking a screenshot"
defaults write com.apple.screencapture show-thumbnail -bool false

echo "Hide 'recent applications' from dock"
defaults write com.apple.dock show-recents -bool false

echo "Update Apple developer utils"
softwareupdate --all --install --force

killall SystemUIServer
killall "Dock"