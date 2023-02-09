#!/usr/bin/env sh

# Specify User Password
#------------------------------------------------

sudo -v

# Path to plist
plist="${userHome}/Library/Preferences/com.apple.dock.plist"

# Check if dockutil is installed
if [[ -x "/usr/local/bin/dockutil" ]]; then
    dockutil="/usr/local/bin/dockutil"
else
    brew install jq
    DLURL=$(curl --silent "https://api.github.com/repos/kcrawford/dockutil/releases/latest" | jq -r '.assets[].browser_download_url' | grep pkg)
    curl -sL ${DLURL} -o /tmp/dockutil.pkg
    sudo installer -pkg "/tmp/dockutil.pkg" -target /
    rm /tmp/dockutil.pkg
fi

# Version dockutil
dockutilVersion=$(${dockutil} --version)
echo "Dockutil version = ${dockutilVersion}"

# Create a clean Dock
"${dockutil}" --remove all --no-restart ${plist}
echo "clean-out the Dock"

# Full path to Applications to add to the Dock
apps=(
"/System/Applications/Calendar.app"
"/Applications/Google Chrome.app"
"/Applications/Safari.app"
)

# Loop through Apps and check if App is installed, If Installed at App to the Dock.
for app in "${apps[@]}"; 
do
	if [[ -e ${app} ]]; then
		"${dockutil}" --add "$app" --no-restart ${plist};
	else
		echo "${app} not installed"
    fi
done

# sleep 3


# Cleanup
#------------------------------------------------
brew uninstall jq


# Kill dock to use new settings
killall -KILL Dock
echo "Restarted the Dock"

echo "Finished creating default Dock"

# Remove all items from the Dock
#------------------------------------------------
#dockutil --remove all

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
