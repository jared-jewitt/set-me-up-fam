###############################################################################################
# Environment variables
###############################################################################################

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export ZSH="/Users/jaredjewitt/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"

###############################################################################################
# ZSH Settings and plugins
###############################################################################################

ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

plugins=(
  dnf
  git
  docker
  zsh-syntax-highlighting
  zsh-autosuggestions
)

###############################################################################################
# Runtime scripts
###############################################################################################

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# NVM
source $(brew --prefix nvm)/nvm.sh

# Pyenv + Pyenv Virtualenv
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Powerlevel10k
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
if [[ -r "${XDG_CACHE_HOME:-"$HOME"/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-"$HOME"/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############################################################################################
# Aliases
###############################################################################################

# ColorLS
if [ -x "$(command -v colorls)" ]; then
  alias ls="colorls"
  alias la="colorls -al"
fi
