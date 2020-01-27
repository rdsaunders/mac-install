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

# Specify User Password
sudo -v

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
brew install nvm
# brew install node
brew install imagemagick
brew install s3cmd

# Development Tools
CASKDEV=(
    github
    visual-studio-code
    sourcetree
    cyberduck
    postman
)


echo "Installing cask development tools..."
brew cask install --appdir="/Applications" ${CASKDEV[@]}

# Browsers
CASKBROWSERS=(
    firefox
    google-chrome
    microsoft-edge
)

echo "Installing cask web browsers..."
brew cask install --appdir="/Applications" ${CASKBROWSERS[@]}


# Design & Writing
CASKCREATIVE=(
    imageoptim
    sketch
    screenflow
    ocenaudio
    figma
    figmadaemon
)

echo "Installing cask design and writing apps..."
brew cask install --appdir="/Applications" ${CASKCREATIVE[@]}


# Social & Communication
CASKCOMMS=(
    skype
    slack
    zoomus
)

echo "Installing cask social and communication apps..."
brew cask install --appdir="/Applications" ${CASKCOMMS[@]}


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
brew cask install --appdir="/Applications" ${CASKUTILS[@]}

# Install fonts
brew tap homebrew/cask-fonts
brew cask install font-lato

# Install visual studio code extensions
echo "Installing Visual Studio Extensions..."
code --install-extension bierner.markdown-preview-github-styles
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension file-icons.file-icons
code --install-extension mdickin.markdown-shortcuts
code --install-extension wayou.vscode-todo-highlight
code --install-extension mrmlnc.vscode-duplicate
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension Tyriar.sort-lines

# Git Config & SSH Key Generation

echo "Setting up Git Config and SSH Key Gen"

git config --global user.name "Richard Saunders"
git config --global user.email "r.saunders@zengenti.com"
ssh-keygen -t rsa -C "r.saunders@zengenti.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub

echo "Creating folder structure..."
[[ ! -d GIT ]] && mkdir GIT
[[ ! -d GitHub ]] && mkdir GitHub

# Remove shadows from screenshots
defaults write com.apple.screencapture disable-shadow -bool true


echo "***************"
echo "Automation complete"
echo "---------------"
echo "Now go to Bitbucket > Manage Account > SSH Keys > Add key and paste in the copied public key"
echo "***************"
