# Dotfiles

Personal dotfiles for macOS. One command to set up a new machine.

## What's Included

| Tool | Description |
|------|-------------|
| [Neovim](https://neovim.io/) | Modern Vim-based editor with LazyVim |
| [Ghostty](https://ghostty.org/) | Fast, native terminal emulator |
| [WezTerm](https://wezfurlong.org/wezterm/) | GPU-accelerated terminal emulator |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [Zsh](https://www.zsh.org/) | Shell with Oh My Zsh |
| [Starship](https://starship.rs/) | Cross-shell prompt |
| [Docker](https://www.docker.com/) | Containerization platform |
| [LazyDocker](https://github.com/jesseduffield/lazydocker) | Terminal UI for Docker |

## Quick Start

```bash
git clone https://github.com/ikorason/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script will:

1. Install [Homebrew](https://brew.sh/) if not present
2. Install all dependencies from `Brewfile`
3. Install [Oh My Zsh](https://ohmyz.sh/) and plugins
4. Create symlinks for all configurations

## Repository Structure

```
dotfiles/
├── install.sh                  # Bootstrap script
├── Brewfile                    # Homebrew dependencies
├── .gitignore
└── config/
    ├── nvim/                   # Neovim (LazyVim)
    │   ├── init.lua
    │   └── lua/
    │       ├── config/         # Core settings
    │       └── plugins/        # Plugin configs
    ├── ghostty/
    │   └── config              # Ghostty config
    ├── wezterm/
    │   └── wezterm.lua         # WezTerm config
    ├── tmux/
    │   └── tmux.conf           # tmux config
    └── zsh/
        └── zshrc               # Zsh config
```

## Symlinks

The install script creates these symlinks:

| Source | Target |
|--------|--------|
| `config/nvim` | `~/.config/nvim` |
| `config/ghostty` | `~/.config/ghostty` |
| `config/wezterm` | `~/.config/wezterm` |
| `config/tmux` | `~/.config/tmux` |
| `config/zsh/zshrc` | `~/.zshrc` |

## Configurations

### Neovim

LazyVim-based configuration with LSP, fuzzy finding (fzf-lua), and Everforest colorscheme.

### Ghostty

- Font: mononoki Nerd Font (size 18)
- Theme: Everforest Dark Hard

### WezTerm

- Font: mononoki Nerd Font (size 16)
- Color scheme: Everforest Dark
- Background opacity with blur
- Minimal window decorations

### tmux

- Prefix: `Ctrl-a`
- Mouse support enabled
- Vim-style pane navigation

| Key | Action |
|-----|--------|
| `Ctrl-a \|` | Split horizontally |
| `Ctrl-a -` | Split vertically |
| `Ctrl-a h/j/k/l` | Navigate panes |
| `Ctrl-a H/J/K/L` | Resize panes |
| `Ctrl-a c` | New window |
| `Ctrl-a r` | Reload config |

### Zsh

Oh My Zsh with Starship prompt.

**Plugins:** git, zsh-autosuggestions, zsh-syntax-highlighting, z

**Aliases:**

| Alias | Command |
|-------|---------|
| `v` | `nvim` |
| `lg` | `lazygit` |
| `ls` | `eza --icons` |
| `ll` | `eza -la --icons` |
| `cat` | `bat` |
| `gs` | `git status` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gp` | `git push` |
| `t` | `tmux` |
| `ta` | `tmux attach` |
| `d` | `docker` |
| `dc` | `docker compose` |
| `dps` | `docker ps` |
| `lzd` | `lazydocker` |

## Dependencies (Brewfile)

**CLI Tools:**
- neovim, tmux, git, lazygit
- ripgrep, fd, fzf
- eza, bat, zoxide
- starship

**Programming Languages:**
- Node.js
- Go (with gopls language server)
- Rust

**Docker Tools:**
- lazydocker (TUI for Docker)
- dive (image layer explorer)
- hadolint (Dockerfile linter)

**Applications:**
- Ghostty
- WezTerm
- Docker Desktop

**Fonts:**
- mononoki Nerd Font

## Post-Installation

Restart your terminal or run:

```bash
source ~/.zshrc
```

Neovim will auto-install plugins on first launch.

## Local Overrides

Create `~/.zshrc.local` for machine-specific settings (not tracked in git):

```bash
# Example: work-specific paths
export PATH="$HOME/work/bin:$PATH"
```

## Updating

```bash
cd ~/dotfiles
git pull
./install.sh
```
