export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ikorason"

plugins=(
  git
  rust
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias vim="nvim"
alias lg="lazygit"

export EDITOR="nvim"
export PATH="/opt/homebrew/bin:$PATH"
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

eval "$(starship init zsh)"
