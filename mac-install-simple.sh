#!/usr/bin/env sh

#===================================================
# Automation script for setting up a new OSX machine
#=================================================== 

# Specify User Password
#------------------------------------------------

sudo -v

# Run MacOS X Software Updates
#------------------------------------------------

echo "Running Software Updates..."
softwareupdate -i -r

#================================================
# Install Homebrew
#================================================
if ! [[ $(grep "bin/brew shellenv" "$HOME/.zprofile") ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zprofile && source ~/.zprofile
fi

# Disable Brew Analytics
#------------------------------------------------

brew analytics off
brew analytics

# Check everything is ok with homebrew
#------------------------------------------------

brew doctor

#================================================
# Development tools
#================================================

# Git & command line
#------------------------------------------------
brew install git
brew install wget

# Node & NPM
#------------------------------------------------
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.zshrc
nvm install node
brew install yarn
npm i -g npm


#================================================
# Hombrew Casks
#================================================

# Browsers
#------------------------------------------------
brew install --cask firefox
brew install --cask google-chrome
brew install --cask microsoft-edge

# Design & Writing
#------------------------------------------------
brew install --cask figma
brew install --cask notion

# Social & Communication
#------------------------------------------------
brew install --cask zoom
brew install --cask microsoft-teams
brew install --cask whatsapp
