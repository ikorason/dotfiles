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

## Docker stuff

# List all currently running containers
alias dps='docker ps'

# List all containers (including stopped ones)
alias dpsa='docker ps -a'

# List all Docker images on your system
alias di='docker images'

# Execute a command interactively in a running container
# Usage: dex <container_name> <command>
# Example: dex my_container bash
alias dex='docker exec -it'

# Follow/tail the logs of a container in real-time
# Usage: dlog <container_name>
alias dlog='docker logs -f'

# Stop all currently running containers at once
alias dstop='docker ps -q | xargs -p docker stop'

# Remove all containers (both running and stopped)
# Note: You may want to stop containers first with dstop
alias drm='docker ps -aq | xargs -p docker rm'

# pnpm
export PNPM_HOME="/Users/irfannito/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
