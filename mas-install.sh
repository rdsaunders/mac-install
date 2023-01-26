#!/bin/sh

# install mas-cli to install from the Mac App store
brew install mas

# get Apple ID
echo "You'll need to open the Mac App Store and ensure you are logged in"

read -p "Press [Enter] key to start install..."

# install macos apps
mas install 409183694  # Keynote (12.2.1)
mas install 405399194  # Kindle (1.39.0)
mas install 409203825  # Numbers (12.2.1)
mas install 775737590  # iA Writer (6.0.4)
mas install 1289583905 # Pixelmator Pro (3.2.3)
mas install 1450640351 # Lightweight PDF (1.0.5)
mas install 1254981365 # Contrast (1.3.2)
mas install 411643860  # DaisyDisk (4.24)
