read -p "What is this machine's label (Example: \"Alchemist\")? " mac_os_label
if [[ -z "$mac_os_label" ]]; then
  printf "ERROR: Invalid MacOS label.\n"
  exit 1
fi

read -p "What is this machine's name (Example: \"alchemist\")? " mac_os_name
if [[ -z "$mac_os_name" ]]; then
  printf "ERROR: Invalid MacOS name.\n"
  exit 1
fi

read -p "Delete all files in $HOME/Documents (y/n)? " documents
if [[ "$documents" == "y" ]]; then
  rm -rf $HOME/Documents/*
  printf "%s\n" "Documents deleted."
fi

read -p "Delete all files in $HOME/Downloads (y/n)? " downloads
if [[ "$downloads" == "y" ]]; then
  rm -rf $HOME/Downloads/*
  printf "%s\n" "Downloads deleted."
fi

printf "Setting system label and name...\n"
sudo scutil --set ComputerName $mac_os_label
sudo scutil --set HostName $mac_os_name
sudo scutil --set LocalHostName $mac_os_name
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $mac_os_name

printf "System - Disable boot sound effects\n"
sudo nvram SystemAudioVolume=" "

printf "System - Reveal IP address, hostname, OS version, etc. when clicking the login window clock\n"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

printf "System - Disable automatic termination of inactive apps\n"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

printf "System - Expand save panel by default\n"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

printf "System - Disable the 'Are you sure you want to open this application?' dialog\n"
defaults write com.apple.LaunchServices LSQuarantine -bool false

printf "System - Increase window resize speed for Cocoa applications\n"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

printf "System - Disable window resume system-wide\n"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

printf "System - Disable auto-correct\n"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

printf "System - Disable automatic capitalization as it’s annoying when typing code\n"
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

printf "System - Disable automatic period substitution as it’s annoying when typing code\n"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

printf "System - Disable smart quotes (not useful when writing code)\n"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

printf "System - Disable smart dashes (not useful when writing code)\n"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

printf "System - Require password immediately after sleep or screen saver begins\n"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

printf "System - Avoid creating .DS_Store files on network volumes\n"
defaults write com.apple.dashboard mcx-disabled -boolean TRUE

printf "System - Avoid creating .DS_Store files on network volumes\n"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "Trackpad - Map bottom right corner to right-click\n"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

printf "Dock - Remove all default app icons\n"
defaults write com.apple.dock persistent-apps -array

printf "Dock - Automatically hide and show\n"
defaults write com.apple.dock autohide -bool true

printf "Dock - Remove the auto-hiding delay\n"
defaults write com.apple.Dock autohide-delay -float 0

printf "Dock - Don’t show Dashboard as a Space\n"
defaults write com.apple.dock "dashboard-in-overlay" -bool true

printf "Finder - Show the $HOME/Library folder\n"
chflags nohidden $HOME/Library

printf "Finder - Show filename extensions\n"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf "Finder - Disable the warning when changing a file extension\n"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

printf "Finder - Show path bar\n"
defaults write com.apple.finder ShowPathbar -bool true

printf "Finder - Show status bar\n"
defaults write com.apple.finder ShowStatusBar -bool true

printf "Finder - Display full POSIX path as window title\n"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

printf "Finder - Use list view in all Finder windows\n"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

printf "Finder - Disable the warning before emptying the Trash\n"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

printf "Safari - Set home page to 'about:blank' for faster loading\n"
defaults write com.apple.Safari HomePage -string "about:blank"

printf "Safari - Hide bookmarks bar\n"
defaults write com.apple.Safari ShowFavoritesBar -bool false

printf "Safari - Use Contains instead of Starts With in search banners\n"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

printf "Safari - Enable debug menu\n"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

printf "Safari - Enable the Develop menu and the Web Inspector\n"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

printf "Safari - Add a context menu item for showing the Web Inspector in web views\n"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

printf "Safari - Disable sending search queries to Apple.\n"
defaults write com.apple.Safari UniversalSearchEnabled -bool false

printf "TextEdit - Use plain text mode for new documents\n"
defaults write com.apple.TextEdit RichText -int 0

printf "TextEdit - Open and save files as UTF-8 encoding\n"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

printf "Game Center - Disable Game Center\n"
defaults write com.apple.gamed Disabled -bool true

printf "App Store - Enable the WebKit Developer Tools in the Mac App Store\n"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

printf "App Store - Enable Debug Menu in the Mac App Store\n"
defaults write com.apple.appstore ShowDebugMenu -bool true

printf "Installing Xcode CLI tools...\n"
xcode-select --install

printf "%s\n" "💡 ALT+TAB to view and accept Xcode license window."
read -p "Have you completed the Xcode CLI tools install (y/n)? " xcode_response
if [[ "$xcode_response" != "y" ]]; then
  printf "ERROR: Xcode CLI tools must be installed before proceeding.\n"
  exit 1
fi

if ! command -v brew > /dev/null; then
  ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export PATH="/usr/local/bin:$PATH"
  printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
fi

brew tap caskroom/fonts
brew cask install font-fira-code

brew cask install dashlane
brew cask install firefox
brew cask install google-chrome
brew cask install keybase
brew cask install ngrok
brew cask install spotify
brew cask install sublime-text

brew install bash
brew install bash-completion
brew install byobu
brew install cmake
brew install fzf
brew install git
brew install kubernetes-cli; kubectl completion bash >/usr/local/etc/bash_completion.d/kubectl
brew install mas
brew install python3
brew install tig
brew install tmux

# Slack
mas install 803453959

# Docker
brew install docker
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion $(brew --prefix)/etc/bash_completion.d/docker
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-compose

curl https://sh.rustup.rs -sSf | sh

cargo install exa
cargo install ripgrep

git config --global user.email samuel@cormier-iijima.com
git config --global user.name "Samuel Cormier-Iijima"

# TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp ./terminal/bashrc $HOME/.bashrc
cp ./terminal/inputrc $HOME/.inputrc
cp ./terminal/keybindings.tmux $HOME/.byobu/keybindings.tmux
cp ./terminal/tmux.conf $HOME/.byobu/.tmux.conf
cp ./terminal/tmux.conf $HOME/.tmux.conf

cp ./dev/gitconfig ~/.gitconfig
