#!/bin/sh

# Install XCODE Command Line Tools
xcode-select --install

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Check everything is ok with homebrew
brew doctor

# Development
brew install wget
brew install node
brew install imagemagick
brew cask install github-desktop
brew cask install atom
brew cask install codekit
brew cask install cornerstone
brew cask install vmware-fusion
brew cask install sublime-text
brew cask install transmit

# Browsers
brew cask install firefox
brew cask install google-chrome
brew cask install opera

# Social & Communication
brew cask install hipchat
brew cask install google-hangouts
brew cask install skype

# Design & Writing
brew cask install evernote
brew cask install imageoptim
brew cask install sketch

# Utilities
brew cask install flux
brew cask install dropbox
brew cask install 1password
brew cask install spotify
brew cask install viscosity
brew cask install fitbit-connect
brew cask install google-drive
brew cask install google-earth
brew cask install google-photos-backup


echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-inconsolidata
    font-roboto
    font-clear-sans
)
brew cask install ${FONTS[@]}

echo "Configuring OSX..."

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Bootstrapping complete"
