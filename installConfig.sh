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


# Development Tools
CASKDEV=(
    github-desktop
    atom
    codekit
    cornerstone
    vmware-fusion
    sublime-text
    transmit
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
)

echo "Installing cask design and writing apps..."
brew cask install ${CASKCREATIVE[@]}


# Social & Communication
CASKCOMMS=(
    hipchat
    google-hangouts
    skype
)

echo "Installing cask social and communication apps..."
brew cask install ${CASKCOMMS[@]}


# Utlities
CASKUTILS=(
    flux
    dropbox
    1password
    spotify
    viscosity
    fitbit-connect
    google-drive
    google-earth
    google-photos-backup
)

echo "Installing cask utilities..."
brew cask install ${CASKUTILS[@]}


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
