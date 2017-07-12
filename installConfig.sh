#!/usr/bin/env bash
# 
# Automation script for setting up a new OSX machine
# 
# Some apps don't have a cask and so still need to be installed by hand. These
# include:
#
# - Tweetbot (app store)
# - Wunderlist (app store)
# - ToDoIst (app store)
# - IA Writer
# - Microsoft Remote Desktop
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
brew install wget
brew install node
brew install imagemagick


# Development Tools
CASKDEV=(
    github-desktop
    atom
    visual-studio-code
    transmit
    sourcetree
    cyberduck
)


echo "Installing cask development tools..."
brew cask install ${CASKDEV[@]}

# Browsers
CASKBROWSERS=(
    firefox
    google-chrome
    opera
)

echo "Installing cask web browsers..."
brew cask install ${CASKBROWSERS[@]}


# Design & Writing
CASKCREATIVE=(
    evernote
    imageoptim
    sketch
    mindnode-pro
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
    google-drive
    google-earth
    google-photos-backup
    sitesucker
    daisydisk
    aerial
    rescuetime
    the-unarchiver
    paparazzi
)

echo "Installing cask utilities..."
brew cask install ${CASKUTILS[@]}

echo "Configuring OSX..."

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Automation complete"
