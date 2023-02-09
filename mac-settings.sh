#!/usr/bin/env sh

echo "Setting some Mac settings..."


# For a helpful list of Mac OS defaults refer to https://macos-defaults.com. 
# There is also a diff.sh script that can be run to locate the setting you are looking for.

#================================================
# Close System Preferences
#================================================
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'


#================================================
# Finder - General
#================================================
# Finder | Show Path Bar
defaults write com.apple.finder "ShowPathbar" -bool "true"
# Finder | Show folders and files as list 
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
# Finder | Show hard drives on desktop
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true"
# Finder | Show external hard drives on desktop
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true"
# Finder | Show mounted servers on desktop
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "true"
# Finder | Show removeable media on desktop
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "true"
# Finder | Set default location to home folder
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
# Finder | Trash | Automatically empty bin after 30 days
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"
# Finder | Renaming | Disable warning before changing an extension
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"


#================================================
# Finder - Desktop
#================================================
# Set preferred group by 
defaults write com.apple.finder "FXPreferredGroupBy" -string "Name"
# Finder | Desktop > View options | Icon size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist
# Finder | Desktop > View options | Text size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" ~/Library/Preferences/com.apple.finder.plist
# Finder | Desktop > View options | Label position: bottom
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:labelOnBottom 1" ~/Library/Preferences/com.apple.finder.plist
# Finder | Desktop > View options | Show item info
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo 1" ~/Library/Preferences/com.apple.finder.plist
# Finder | Desktop > View options | Show icon preview
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showIconPreview 1" ~/Library/Preferences/com.apple.finder.plist
# Finder | Desktop > View options | Stack by Kind
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:GroupBy Kind" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:GroupBy Kind" ~/Library/Preferences/com.apple.finder.plist
# Finder | Desktop > View options | Sort by Date Added
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy dateAdded" ~/Library/Preferences/com.apple.finder.plist


#================================================
# Settings - Appearance
#================================================
# Settings | Appearance | Allow wallpaper tinting in windows `Off`
# Note: This is not a boolean as you'd expect and the value is in reverse 1=Off, 0=On
defaults write NSGlobalDomain "AppleReduceDesktopTinting" -int "1"
# Settings | Appearance | Show scroll bars `Always`
defaults write NSGlobalDomain "AppleShowScrollBars" -string "Always"


#================================================
# Settings - Dock
#================================================
# Settings | Desktop & Dock | Size `Small`
defaults write com.apple.dock "tilesize" -int "16"
# Settings | Desktop & Dock | Turn on magnification `On`
defaults write com.apple.dock "magnification" -bool "true"
# Settings | Desktop & Dock | Magnification tile size `Large`
defaults write com.apple.dock "largesize" -int "128"
# Settings | Desktop & Dock | Position `Bottom`
defaults write com.apple.dock "orientation" -string "bottom"
# Settings | Desktop & Dock | Show indicators for open applicatopms
defaults write com.apple.dock "show-process-indicators" -bool "false"
# Settings | Desktop & Dock | Show recent applications in the dock
defaults write com.apple.dock "show-recents" -bool "false"


#================================================
# Settings - Siri & Spotlight
#================================================
# Settings | Siri & Spotlight
defaults write com.apple.Siri "StatusMenuVisible" -bool "false"


#================================================
# Settings - Sound
#================================================
# Settings | Play user interface sound effects `off`
defaults write NSGlobalDomain "com.apple.sound.uiaudio.enabled" -int "0"


#================================================
# Settings - Mouse
#================================================
# Settings | Mouse | Tracking speed `Fast`
defaults write NSGlobalDomain "com.apple.mouse.scaling" -int "3"
# Settings | Mouse | Natural scrolling `On`
defaults write NSGlobalDomain "com.apple.swipescrolldirection" -bool "true"
# Settings | Mouse | Secondary click `Click right side`
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseButtonMode" -string "TwoButton"
defaults write com.apple.AppleMultitouchMouse "MouseButtonMode" -string "TwoButton"


#================================================
# Settings - Trackpad
#================================================
# Settings | Trackpad | Tracking speed `4`
defaults write NSGlobalDomain "com.apple.trackpad.scaling" -int "3"
# Settings | Trackpad | Click `Medium`
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "1"
defaults write com.apple.AppleMultitouchTrackpad "SecondClickThreshold" -int "1"
# Settings | Trackpad | Force click and haptic feedback `On`
defaults write com.apple.AppleMultitouchTrackpad "ForceSuppressed" -bool "true"
# Settings | Trackpad | Secondary click `Click in bottom right corner`
defaults write com.apple.AppleMultitouchTrackpad "TrackpadCornerSecondaryClick" -int "2"
# Settings | Trackpad | Tap to click `On`
defaults write com.apple.AppleMultitouchTrackpad "Clicking" -bool "true"


#================================================
# Settings - Keyboard
#================================================
# Settings | Keyboard | Keyboard navigation `On`
defaults write NSGlobalDomain "AppleKeyboardUIMode" -int "2"


#================================================
# Application - Safari
#================================================
# Safari | Settings | Advanced | Show Develop menu in menu bar
defaults write com.apple.Safari.SandboxBroker "ShowDevelopMenu" -bool "true"


#================================================
# System - OS Defaults
#================================================
# Screenshots | Remove default dropshadow
defaults write com.apple.screencapture "disable-shadow" -bool "true"

# System | Save Dialogs | Expand save panel globally
defaults write -g "NSNavPanelExpandedStateForSaveMode" -bool "true" && \
defaults write -g "NSNavPanelExpandedStateForSaveMode2" -bool "true"



#================================================
# Kill affected applications
#================================================
killall SystemUIServer
killall cfprefsd
killall Finder
killall Dock


echo "Done!"
