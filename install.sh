#!/bin/bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on macOS
if [[ "$(uname)" != "Darwin" ]]; then
    error "This script is intended for macOS only"
    exit 1
fi

# Install Homebrew if not present
install_homebrew() {
    if ! command -v brew &> /dev/null; then
        info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add Homebrew to PATH for Apple Silicon Macs
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    else
        info "Homebrew already installed"
    fi
}

# Install dependencies from Brewfile
install_dependencies() {
    if [[ -f "$DOTFILES_DIR/Brewfile" ]]; then
        info "Installing dependencies from Brewfile..."
        brew bundle --file="$DOTFILES_DIR/Brewfile"
    else
        warn "No Brewfile found, skipping dependency installation"
    fi
}

# Create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"

    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target")"

    if [[ -L "$target" ]]; then
        # Remove existing symlink
        rm "$target"
        info "Removed existing symlink: $target"
    elif [[ -e "$target" ]]; then
        # Backup existing file/directory
        local backup="${target}.backup.$(date +%Y%m%d%H%M%S)"
        mv "$target" "$backup"
        warn "Backed up existing file to: $backup"
    fi

    ln -s "$source" "$target"
    info "Created symlink: $target -> $source"
}

# Setup symlinks for all configs
setup_symlinks() {
    info "Setting up symlinks..."

    # Ensure .config directory exists
    mkdir -p "$CONFIG_DIR"

    # Neovim
    if [[ -d "$DOTFILES_DIR/config/nvim" ]]; then
        create_symlink "$DOTFILES_DIR/config/nvim" "$CONFIG_DIR/nvim"
    fi

    # WezTerm
    if [[ -d "$DOTFILES_DIR/config/wezterm" ]]; then
        create_symlink "$DOTFILES_DIR/config/wezterm" "$CONFIG_DIR/wezterm"
    fi

    # Tmux
    if [[ -d "$DOTFILES_DIR/config/tmux" ]]; then
        create_symlink "$DOTFILES_DIR/config/tmux" "$CONFIG_DIR/tmux"
    fi

    # Zsh
    if [[ -f "$DOTFILES_DIR/config/zsh/zshrc" ]]; then
        create_symlink "$DOTFILES_DIR/config/zsh/zshrc" "$HOME/.zshrc"
    fi

    if [[ -f "$DOTFILES_DIR/config/zsh/zshenv" ]]; then
        create_symlink "$DOTFILES_DIR/config/zsh/zshenv" "$HOME/.zshenv"
    fi
}

# Install Oh My Zsh if not present
install_oh_my_zsh() {
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        info "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        info "Oh My Zsh already installed"
    fi

    # Install zsh plugins
    local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
        info "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    fi

    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
        info "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    fi
}

# Install fonts
install_fonts() {
    local font_dir="$HOME/Library/Fonts"

    if [[ -d "$DOTFILES_DIR/fonts" ]] && [[ "$(ls -A $DOTFILES_DIR/fonts 2>/dev/null)" ]]; then
        info "Installing fonts..."
        cp -f "$DOTFILES_DIR/fonts/"* "$font_dir/" 2>/dev/null || true
        info "Fonts installed to $font_dir"
    else
        info "No fonts to install"
    fi
}

# Main installation
main() {
    echo ""
    echo "=================================="
    echo "  Dotfiles Installation Script"
    echo "=================================="
    echo ""

    install_homebrew
    install_dependencies
    install_oh_my_zsh
    setup_symlinks
    install_fonts

    echo ""
    info "Installation complete!"
    info "Please restart your terminal or run: source ~/.zshrc"
    echo ""
}

main "$@"
