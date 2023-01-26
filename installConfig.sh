#!/usr/bin/env bash
# 
# Automation script for setting up a new OSX machine
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

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Check everything is ok with homebrew
brew doctor

# Development
# brew install git
# brew install wget
# brew install curl

# Language
## Node / Javascript
# mkdir ~/.nvm
# brew install nvm
# nvm install node
# brew install yarn  

# Development Tools
CASKDEV=(
    visual-studio-code
    sourcetree
    cyberduck
    postman
    docker
)


echo "Installing cask development tools..."
brew install --appdir="/Applications" ${CASKDEV[@]}

# Browsers
CASKBROWSERS=(
    firefox
    google-chrome
    microsoft-edge
)

echo "Installing cask web browsers..."
brew install --appdir="/Applications" ${CASKBROWSERS[@]}


# Design & Writing
CASKCREATIVE=(
    imageoptim
    screenflow
    figma
    figmadaemon
    notion
    grammarly
)

echo "Installing cask design and writing apps..."
brew install --appdir="/Applications" ${CASKCREATIVE[@]}


# Social & Communication
CASKCOMMS=(
    slack
    zoom
    microsoft-teams
    whatsapp
    discord
)

echo "Installing cask social and communication apps..."
brew install --appdir="/Applications" ${CASKCOMMS[@]}


# Utlities
CASKUTILS=(
    dropbox
    viscosity
    the-unarchiver
    1password
    loom
)

echo "Installing cask utilities..."
brew install --appdir="/Applications" ${CASKUTILS[@]}

# Install fonts
brew tap homebrew/cask-fonts
brew install font-lato
brew install font-poppins
brew install font-sf-compact
brew install font-sf-mono
brew install font-sf-po
brew install font-new-york

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
