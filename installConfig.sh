#!/usr/bin/env bash
# 
# Automation script for setting up a new OSX machine
# 
# Some apps don't have a cask and so still need to be installed by hand. These
# include:
#
# - Wunderlist (app store)
# - ToDoIst (app store)
# - IA Writer
# - Bear
# - Contrast colour accessibility
#
# Notes:
#
#   If installing full Xcode, it's better to install that first from the app
#   store before running the automation script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.

# Run MacOS X Software Updates
echo "Running Software Updates..."
softwareupdate -i -r

# Install XCODE Command Line Tools
xcode-select --install

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Check everything is ok with homebrew
brew doctor

# Development
brew install git
brew install wget
brew install node
brew install imagemagick
brew install s3cmd

# Development Tools
CASKDEV=(
    github
    visual-studio-code
    sourcetree
    cyberduck
)


echo "Installing cask development tools..."
brew cask install ${CASKDEV[@]}

# Browsers
CASKBROWSERS=(
    firefox
    google-chrome
)

echo "Installing cask web browsers..."
brew cask install ${CASKBROWSERS[@]}


# Design & Writing
CASKCREATIVE=(
    imageoptim
    sketch
    adobe-creative-cloud
    screenflow
    skyfonts
)

echo "Installing cask design and writing apps..."
brew cask install ${CASKCREATIVE[@]}


# Social & Communication
CASKCOMMS=(
    skype
    slack
)

echo "Installing cask social and communication apps..."
brew cask install ${CASKCOMMS[@]}


# Utlities
CASKUTILS=(
    dropbox
    1password
    spotify
    viscosity
    google-drive-file-stream
    google-photos-backup-and-sync
    daisydisk
    rescuetime
    the-unarchiver
    alfred
    bartender
)

echo "Installing cask utilities..."
brew cask install ${CASKUTILS[@]}

echo "Configuring OSX..."

# Require password as soon as screensaver or sleep mode starts
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable tap-to-click
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable Develop menu in Safari
# defaults write com.apple.Safari IncludeDevelopMenu 1
# Set the icon size of Dock items to 36 pixels
# defaults write com.apple.dock tilesize -int 36

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
# defaults write com.apple.dock persistent-apps -array

# When performing a search, search the current folder by default
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Stop iTunes from responding to the keyboard media keys
# launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Show icons for hard drives, servers, and removable media on the desktop
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Avoid creating .DS_Store files on network volumes
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Hide indicator lights for open applications in the Dock
# defaults write com.apple.dock show-process-indicators -bool false


# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center


# Top right screen corner → Notification Center
# defaults write com.apple.dock wvous-tr-corner -int 12
# defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom right screen corner → Start screen saver
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0

# Prevent Time Machine from prompting to use new hard drives as backup volume
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
# hash tmutil &> /dev/null && sudo tmutil disablelocal

# Show item info near icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c “Set :DesktopViewSettings:IconViewSettings:showItemInfo true” ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c “Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true” ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c “Set :StandardViewSettings:IconViewSettings:showItemInfo true” ~/Library/Preferences/com.apple.finder.plist

# Show item info to the right of the icons on the desktop
# /usr/libexec/PlistBuddy -c “Set DesktopViewSettings:IconViewSettings:labelOnBottom false” ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c “Set :DesktopViewSettings:IconViewSettings:arrangeBy grid” ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c “Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid” ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c “Set :StandardViewSettings:IconViewSettings:arrangeBy grid” ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c “Set :DesktopViewSettings:IconViewSettings:gridSpacing 100” ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c “Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100” ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c “Set :StandardViewSettings:IconViewSettings:gridSpacing 100” ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c “Set :DesktopViewSettings:IconViewSettings:iconSize 48” ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c “Set :FK_StandardViewSettings:IconViewSettings:iconSize 48” ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c “Set :StandardViewSettings:IconViewSettings:iconSize 48” ~/Library/Preferences/com.apple.finder.plist

echo "Automation complete"
