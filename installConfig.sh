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
    zoomus
)

echo "Installing cask social and communication apps..."
brew cask install ${CASKCOMMS[@]}


# Utlities
CASKUTILS=(
    dropbox
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

# Install visual studio code extensions
VSEXT=(
    bierner.markdown-preview-github-styles
    DavidAnson.vscode-markdownlint
    file-icons.file-icons
    mdickin.markdown-shortcuts
    wayou.vscode-todo-highlight
}

echo "Installing Visual Studio Extensions..."
code --install-extension ${VSEXT[@]}

# Remove shadows from screenshots
defaults write com.apple.screencapture disable-shadow -bool true

echo "Automation complete"
