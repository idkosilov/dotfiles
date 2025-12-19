#!/bin/bash

# ===== Dock =====
defaults write com.apple.dock tilesize -int 64
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock launchanim -bool false

# ===== Finder =====
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# ===== Keyboard =====
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
defaults write NSGlobalDomain "com.apple.keyboard.fnState" -bool true

killall Dock Finder SystemUIServer
