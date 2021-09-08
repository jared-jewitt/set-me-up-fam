#!/bin/sh

# Install CLI tools
xcode-select --install

# Install Rosetta
softwareupdate --install-rosetta

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Tap into additional brew repositories
brew tap homebrew/cask-fonts

# Install my favourite applications
brew install --cask font-hack-nerd-font
brew install --cask microsoft-edge
brew install --cask google-chrome
brew install --cask firefox
brew install --cask webstorm
brew install --cask pycharm
brew install --cask hyper
brew install --cask docker

# Install my favourite tools
brew install zsh
brew install git
brew install nodenv
brew install rbenv
brew install pyenv

brew cleanup

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-"$HOME"/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-"$HOME"/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

# Copy over config files
mkdir -p "$HOME"/.config/colorls && cp config/colorls.yaml "$HOME"/.config/colorls/dark_colors.yaml
cp config/.zshrc "$HOME"/.zshrc
cp config/.p10k.zsh "$HOME"/.p10k.zsh
cp config/.hyper.js "$HOME"/.hyper.js
cp config/.gitconfig "$HOME"/.gitconfig

# Revoke the current shell
. "$HOME"/.zshrc

# Install Hyper extensions
hyper install hyper-dracula
hyper install hyper-tab-icons
hyper install hyper-search
hyper install hyperterm-paste
hyper install hypercwd

# Set global Node version
nodenv install 16.0.0
nodenv global 16.0.0

# Set global Ruby version
rbenv install 3.0.2
rbenv global 3.0.2

# Set global Python version
pyenv install 3.9.5
pyenv global 3.9.5

# Install global NPM packages
npm install -g prettier
npm install -g eslint
npm install -g stylelint

# Install global GEM packages
gem install colorls

# Install global PIP packages
pip install pygments
pip install pylint
pip install black

# Screw Terminal. Let's start up Hyper
hyper
