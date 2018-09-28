#!/bin/sh

# install mas-cli to install from the Mac App store
brew install mas

# get Apple ID
echo "You'll need to open the Mac App Store and ensure you are logged in"

read -p "Press [Enter] key to start install..."

# install macos apps
mas install 1333542190 # 1Password 7 (7.2.1)
mas install 1254981365 # Contrast (1.1)
mas install 497799835  # Xcode (10.0)
mas install 1091189122 # Bear (1.6.2)
mas install 409183694  # Keynote (8.2)
mas install 1278508951 # Trello (2.10.7)
mas install 775737590  # iA Writer (5.1.2)
mas install 442168834  # SiteSucker (2.11.8)
mas install 585829637  # Todoist (7.1)
