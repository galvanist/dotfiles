#!/bin/sh

set -euxo pipefail

# These are gathered from many different sources.
#
# Sources, references and thanks:
# * https://github.com/SixArm/macos-defaults
# * https://macos-defaults.com
# * https://github.com/sqrthree/defaults-write
# * https://github.com/dirtymouse/defaultswrite
# * https://github.com/mphstudios/macOS_setup
# * https://github.com/paulmillr/dotfiles
# * https://github.com/mathiasbynens/dotfiles
# * https://github.com/stianeikeland/dotfiles/edit/master/bin/sanemacdefaults.sh
# * https://macowners.club/posts/sane-defaults-for-macos/
# * https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/

# General UI/UX

# Always show scrollbars
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# defaults delete NSGlobalDomain AppleShowScrollBars
# defaults read NSGlobalDomain AppleShowScrollBars
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Enable subpixel font rendering on non-Apple LCDs.
# defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Trackpad, mouse, keyboard, Bluetooth accessories, and input
#############################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Dock
######

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

## Minimize animation effect
defaults write com.apple.dock mineffect -string scale

# Show only open applications in the Dock
defaults write com.apple.dock static-only -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Do show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Hot corners
# Possible values: 0 no-op; 2 Mission Control; 3 Show application windows;
# 4 Desktop; 5 Start screen saver; 6 Disable screen saver; 7 Dashboard;
# 10 Put display to sleep; 11 Launchpad; 12 Notification Center
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

## Restart dock
killall Dock

# Finder
########

# Disable Finder window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Use AirDrop over every interface.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Show the ~/Library folder
chflags nohidden ~/Library
# xattr -d com.apple.FinderInfo ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

## Restart dock
killall Finder

# Misc
######

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
# defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
