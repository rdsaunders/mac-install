echo "Setting some Mac settings..."


# For a helpful list of Mac OS defaults refer to https://macos-defaults.com. 
# There is also a diff.sh script that can be run to locate the setting you are looking for.

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


# Settings | Appearance | Allow wallpaper tinting in windows `Off`
defaults write NSGlobalDomain "AppleReduceDesktopTinting" -bool "false";
# Settings | Appearance | Show scroll bars `Always`
defaults write NSGlobalDomain "AppleShowScrollBars" -string "Always"

# Settings | Siri & Spotlight | Search results | Bookmarks & History `Off`

# Settings | Desktop & Dock | Size `Small`
defaults write com.apple.dock "tilesize" -int "16"
# Settings | Desktop & Dock | Turn on magnification `On`
defaults write com.apple.dock "magnification" -bool "true"
# Settings | Desktop & Dock | Magnification tile size `Large`
defaults write com.apple.dock "largesize" -int "128"
# Settings | Desktop & Dock | Position `Bottom`
defaults write com.apple.dock "orientation" -string "bottom"

# Settings | Desktop & Dock | Default web browser `Firefox`


# Settings | Mouse | Tracking speed `Fast`
defaults write NSGlobalDomain "com.apple.mouse.scaling" -int "3"
# Settings | Mouse | Natural scrolling `On`
defaults write NSGlobalDomain "com.apple.swipescrolldirection" -bool "true"
# Settings | Mouse | Secondary click `Click right side`
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseButtonMode" -string "TwoButton"
defaults write com.apple.AppleMultitouchMouse "MouseButtonMode" -string "TwoButton"


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


# Settings | Keyboard | Keyboard navigation `On`
defaults write NSGlobalDomain "AppleKeyboardUIMode" -int "2"


# Safari | Settings | Advanced | Show Develop menu in menu bar
defaults write com.apple.Safari.SandboxBroker "ShowDevelopMenu" -bool "true"


# Screenshots | Remove default dropshadow
defaults write com.apple.screencapture "disable-shadow" -bool "true"

killall Dock
killall Finder
killall SystemUIServer

echo "Done!"
