#!/usr/bin/env sh

# Setup dock
brew install jq
DLURL=$(curl --silent "https://api.github.com/repos/kcrawford/dockutil/releases/latest" | jq -r '.assets[].browser_download_url' | grep pkg)
curl -sL ${DLURL} -o /tmp/dockutil.pkg
sudo installer -pkg "/tmp/dockutil.pkg" -target /
rm /tmp/dockutil.pkg

# Remove all items from the Dock
#------------------------------------------------
dockutil --remove all

# Add dock items
#------------------------------------------------
# Messages
#Calendar
#Slack
#Notion
#--
#Firefox
#Chrome
#Safari
#--
--
##Visual Studio Code
#Figma
#Music

# Cleanup
#------------------------------------------------
brew uninstall jq
