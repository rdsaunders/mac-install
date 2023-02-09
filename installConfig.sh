#!/usr/bin/env sh
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

#================================================
# Install Homebrew
#================================================
if ! [[ $(grep "bin/brew shellenv" "$HOME/.zprofile") ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zprofile && source ~/.zprofile
fi

# Disable Bre Analytics
brew analytics off
brew analytics

# Check everything is ok with homebrew
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

# IDE and development tools
#------------------------------------------------
brew install --cask visual-studio-code
brew install --cask sourcetree
brew install --cask cyberduck
brew install --cask postman
brew install --cask docker

# Browsers
#------------------------------------------------
brew install --cask firefox
brew install --cask google-chrome
brew install --cask microsoft-edge

# Design & Writing
#------------------------------------------------
brew install --cask imageoptim
brew install --cask screenflow
brew install --cask figma
brew install --cask notion
brew install --cask grammarly

# Social & Communication
#------------------------------------------------
brew install --cask slack
brew install --cask zoom
brew install --cask microsoft-teams
brew install --cask whatsapp
brew install --cask discord

# Utlities
#------------------------------------------------
brew install --cask dropbox
brew install --cask viscosity
brew install --cask the-unarchiver
brew install --cask 1password
brew install --cask loom

# Fonts
#------------------------------------------------
brew tap homebrew/cask-fonts
brew install font-lato
brew install font-poppins
brew install font-sf-compact
brew install font-sf-mono
brew install font-sf-pro
brew install font-new-york

# Install visual studio code extensions
# echo "Installing Visual Studio Extensions..."https://github.com/rdsaunders/mac-install/blob/master/installConfig.sh
# code --install-extension bierner.markdown-preview-github-styles
# code --install-extension DavidAnson.vscode-markdownlint
# code --install-extension file-icons.file-icons
# code --install-extension mdickin.markdown-shortcuts
# code --install-extension wayou.vscode-todo-highlight
# code --install-extension mrmlnc.vscode-duplicate
# code --install-extension streetsidesoftware.code-spell-checker
# code --install-extension Tyriar.sort-lines


#================================================
# Git Config & SSH Key Generation
#================================================

echo "#------------------------------------------------"
echo "# Setting up Git Config and SSH Key Gen"
echo "#------------------------------------------------"

git config --global user.name "Richard Saunders"
git config --global user.email "r.saunders@zengenti.com"
ssh-keygen -t ed25519 -b 4096 -C "r.saunders@zengenti.com"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub

echo "#------------------------------------------------"
echo "# Creating folder structure..."
echo "#------------------------------------------------"

[[ ! -d GIT ]] && mkdir GIT
[[ ! -d GitHub ]] && mkdir GitHub


echo "#------------------------------------------------"
echo "# Automation complete"
echo "#------------------------------------------------"
echo "# Now go to Bitbucket > Manage Account > SSH Keys > Add key and paste in the copied public key"
echo "#------------------------------------------------"
