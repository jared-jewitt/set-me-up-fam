#!/bin/sh

# Set default shell
chsh -s /bin/zsh

# Install CLI  tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install my favourite apps
brew install --cask google-chrome
brew install --cask microsoft-edge
brew install --cask firefox
brew install --cask webstorm
brew install --cask pycharm
brew install --cask docker
brew install --cask hyper
brew install --cask font-hack-nerd-font

# Install my favourite development tools
brew install zsh
brew install git
brew install docker
brew install docker-compose
brew install jq
brew install go
brew install python
brew install pyenv
brew install pyenv-virtualenv
brew install nvm

brew cleanup

# Install Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-"$HOME"/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-"$HOME"/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

# Copy over config files
cp config/.zshrc "$HOME"/.zshrc
cp config/.p10k.zsh "$HOME"/.p10k.zsh
cp config/.hyper.js "$HOME"/.hyper.js
cp config/.gitconfg "$HOME"/.gitconfg

. "$HOME"/.zshrc

# Set up Hyper
hyper install hyper-dracula
hyper install hyper-search
hyper install hyperterm-paste
hyper install hypercwd

# Set up NVM
nvm install --lts
nvm use --lts

# Install global NPM packages
npm install -g npm-check-updates
npm install -g eslint
npm install -g stylelint
npm install -g prettier
npm install -g typescript
