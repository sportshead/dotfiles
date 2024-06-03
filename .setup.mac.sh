#!/bin/bash
print() {
	echo
	echo
	echo
	echo "---------------------"
	echo $1
}

echo "Please install Firefox Devloper Edition manually while this script runs in the background"
open "https://www.mozilla.org/en-US/firefox/developer/"

print "Installing xcode CLI tools"
xcode-select --install

print "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
sudo launchctl config user path "$(brew --prefix)/bin:${PATH}"

print "Setting up homebrew auto update"
brew tap homebrew/autoupdate

print "Installing curl"
brew install curl

print "Installing fnm"
~/.setup.fnm.sh
eval "$(fnm env --shell bash --use-on-cd --corepack-enabled)"
print "Installing prettier globally"
npm install -g prettier prettier-plugin-go-template
print "Installing ni"
npm install -g @antfu/ni

print "Installing go"
brew install go
print "Installing python3"
brew install python3

print "Installing jq"
brew install jq

print "Installing lazygit"
brew install jesseduffield/lazygit/lazygit
print "Installing exa"
brew install exa

print "Installing neovim"
brew install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

print "Installing github CLI"
brew install gh

print "Installing zoxide"
brew install zoxide

print "Installing orbstack"
brew install --cask orbstack

print "Installing some CLI tools"
# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg
curl https://github.com/web-flow.gpg | gpg --import -

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install ripgrep
brew install openssh
brew install screen
brew install php
brew install gmp

print "Installin Obsidian"
brew install --cask obsidian
print "Linking icloud and obsidian directories"
ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs icloud
ln -s $HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents obsidian

print "Installing Jetbrains Toolbox"
brew install --cask jetbrains-toolbox

print "Installing VS Code"
brew install --cask visual-studio-code

print "Installing Authy"
brew install --cask authy

print "Installing Spotify"
brew install --cask spotify

print "Installing Chromium"
brew install --cask chromium
xattr -cr /Applications/Chromium.app

print "Installing Caffeine"
brew install --cask domzilla-caffeine

print "Installing Hammerspoon"
brew install --cask hammerspoon

print "Installing Secretive"
brew install --cask secretive

print "Installing gpgmail"
brew install --cask free-gpgmail

print "Installing Insomnia"
brew install --cask insomnia

print "Installing uPic"
brew install --cask bigwig-club/brew/upic

print "Configuring some useful defaults"
osascript -e 'tell application "System Preferences" to quit'
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
# Set ~ as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library
# Expand the following File Info panes:
# "General", "Open with", and "Sharing & Permissions"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true
# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false
# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

print "Remapping Escape to Caps Lock"
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000029,"HIDKeyboardModifierMappingDst":0x700000039},{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'

print "Enabling Touch ID for sudo"
sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
echo "- sudo -e /etc/pam.d/sudo_local"
echo "  Uncomment the line to enable Touch ID"

print "All done!"
