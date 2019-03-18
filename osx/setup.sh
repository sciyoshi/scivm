printf "System - Avoid creating .DS_Store files on network volumes\n"
defaults write com.apple.dashboard mcx-disabled -boolean TRUE

printf "System - Avoid creating .DS_Store files on network volumes\n"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "System - Require password immediately after sleep or screen saver begins\n"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

printf "Trackpad - Map bottom right corner to right-click\n"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

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
