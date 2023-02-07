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
if ! [[ $(grep "bin/brew shellenv" "$HOME/.zprofile") ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zprofile && source ~/.zprofile
fi

# Disable Bre Analytics
brew analytics off
brew analytics

# Check everything is ok with homebrew
brew doctor

# Development
brew install git
brew install wget
brew install curl
brew install dockutil

# Language
## Node / Javascript
mkdir ~/.nvm
brew install nvm
nvm install node
brew install yarn  


## Install casks
install_cask () { 
    if brew info "${1}" | grep "Not installed" >/dev/null 2>&1 ; then 
        brew install --cask "${1}"
    else
        echo "The brew cask ${1} has already been installed"
    fi
}

# Development Tools
install_cask visual-studio-code
install_cask sourcetree
install_cask cyberduck
install_cask postman
install_cask docker

# Browsers
install_cask firefox
install_cask google-chrome
install_cask microsoft-edge

# Design & Writing
install_cask imageoptim
install_cask screenflow
install_cask figma
install_cask figmadaemon
install_cask notion
install_cask grammarly

# Social & Communication
install_cask slack
install_cask zoom
install_cask microsoft-teams
install_cask whatsapp
install_cask discord

# Utlities
install_cask dropbox
install_cask viscosity
install_cask the-unarchiver
install_cask 1password
install_cask loom


# Install fonts
brew tap homebrew/cask-fonts
brew install font-lato
brew install font-poppins
brew install font-sf-compact
brew install font-sf-mono
brew install font-sf-pro
brew install font-new-york

# Install visual studio code extensions
# echo "Installing Visual Studio Extensions..."
# code --install-extension bierner.markdown-preview-github-styles
# code --install-extension DavidAnson.vscode-markdownlint
# code --install-extension file-icons.file-icons
# code --install-extension mdickin.markdown-shortcuts
# code --install-extension wayou.vscode-todo-highlight
# code --install-extension mrmlnc.vscode-duplicate
# code --install-extension streetsidesoftware.code-spell-checker
# code --install-extension Tyriar.sort-lines

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
