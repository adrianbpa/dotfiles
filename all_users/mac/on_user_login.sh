## OSX Tweaks

##
## File system
##
# Show the ~/Library folder
chflags nohidden ~/Library

##
## com.apple.dock
##
# Remove dock show/hide delay
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.1
# Automatically hide and show the dock
defaults write com.apple.dock autohide -bool false
# Make hidden applications semi-transparent on the dock
defaults write com.apple.dock showhidden -bool true

##
## com.apple.finder
##
# Show the path bar in the Finder
defaults write com.apple.finder ShowPathbar -bool true
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

##
## com.apple.messageshelper
##
# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

##
## com.apple.SoftwareUpdates
##
# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

##
## com.apple.sound
##
# Disable sound effect when changing volume 
defaults write -g com.apple.sound.beep.feedback -integer 0

##
## com.apple.terminal
##
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

##
## NSGlobalDomain
##
# Enable keyboard access for all controls/modals
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Disable OS X press-and-hold keys to increase key repeat rate.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set up a fast key repeat rate.
defaults write NSGlobalDomain KeyRepeat -int 0.02
# Decrease the delay until keys are repeated.
defaults write NSGlobalDomain InitialKeyRepeat -int 12
# Expand the Save panel by default in all applications
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# Expand the Printer panel by default in all applications
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Reset the dock
killall Dock

# Reset finder
killall Finder
