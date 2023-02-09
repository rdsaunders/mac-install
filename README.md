# mac-install
A script for configuring a new mac using Homebrew &amp; Cask

## Initial setup: Git, Brew, Casks, Non App store applications

`curl -L https://raw.githubusercontent.com/rdsaunders/mac-install/master/installConfig.sh | zsh`

## Mac settings and defaults

`curl -L https://raw.githubusercontent.com/rdsaunders/mac-install/master/mac-settings.sh | zsh`

## Mac Dock

`curl -L https://raw.githubusercontent.com/rdsaunders/mac-install/master/mac-dock.sh | zsh`

## App store applications

`curl -L https://raw.githubusercontent.com/rdsaunders/mac-install/master/mas-install.sh | zsh`


## Save keyboard shortcuts
If you want to save you're current keyboard shortcuts. Execute the following command:

`sh save-hotkeys.sh`

This script will save your shortcut keys to the root of a Dropbox folder.

To install the shortcuts on a new machine run.

`./install-hotkeys.sh`
