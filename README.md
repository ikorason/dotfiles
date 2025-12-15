# Dotfiles

Personal dotfiles for macOS. One command to set up a new machine.

## What's Included

| Tool | Description |
|------|-------------|
| [Neovim](https://neovim.io/) | Modern Vim-based editor with LazyVim config |
| [WezTerm](https://wezfurlong.org/wezterm/) | GPU-accelerated terminal emulator |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [Zsh](https://www.zsh.org/) | Shell with Oh My Zsh |
| [Starship](https://starship.rs/) | Cross-shell prompt |

## Quick Start

```bash
# Clone the repository
git clone https://github.com/ikorason/dotfiles.git ~/dotfiles

# Run the install script
cd ~/dotfiles
./install.sh
```

The install script will:

1. Install [Homebrew](https://brew.sh/) (if not already installed)
2. Install all dependencies from `Brewfile`
3. Install [Oh My Zsh](https://ohmyz.sh/)
4. Create symlinks for all configurations
5. Install fonts from the `fonts/` directory

## Repository Structure

```
dotfiles/
├── install.sh              # Bootstrap script
├── Brewfile                # Homebrew dependencies
├── config/
│   ├── nvim/               # Neovim configuration (LazyVim)
│   ├── wezterm/
│   │   └── wezterm.lua     # WezTerm configuration
│   ├── tmux/
│   │   └── tmux.conf       # tmux configuration
│   └── zsh/
│       └── zshrc           # Zsh configuration
└── fonts/                  # Custom fonts (copy .ttf/.otf files here)
```

## Configurations

### Neovim

LazyVim-based configuration with:

- LSP support
- Fuzzy finding with fzf-lua
- Custom colorscheme (Everforest)
- And more...

**Config location:** `~/.config/nvim` → `~/dotfiles/config/nvim`

### WezTerm

GPU-accelerated terminal with:

- Everforest Dark color scheme
- Mononoki font
- Minimal window decorations
- Background blur

**Config location:** `~/.config/wezterm` → `~/dotfiles/config/wezterm`

### tmux

Terminal multiplexer configured with:

- Prefix: `Ctrl-a` (instead of `Ctrl-b`)
- Mouse support enabled
- Vim-style pane navigation (`h`, `j`, `k`, `l`)
- Split panes: `|` (horizontal), `-` (vertical)
- Status bar at top
- True color support

**Key bindings:**

| Key | Action |
|-----|--------|
| `Ctrl-a \|` | Split pane horizontally |
| `Ctrl-a -` | Split pane vertically |
| `Ctrl-a h/j/k/l` | Navigate panes |
| `Ctrl-a H/J/K/L` | Resize panes |
| `Ctrl-a c` | New window |
| `Ctrl-a r` | Reload config |

**Config location:** `~/.config/tmux` → `~/dotfiles/config/tmux`

### Zsh

Zsh shell with Oh My Zsh and:

- Starship prompt
- Plugins: git, zsh-autosuggestions, zsh-syntax-highlighting, z
- Modern CLI tool aliases (eza, bat, zoxide)
- Useful git aliases

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

**Config location:** `~/.zshrc` → `~/dotfiles/config/zsh/zshrc`

## Dependencies

Installed via Homebrew (`Brewfile`):

**CLI Tools:**

- neovim, tmux, git, lazygit
- ripgrep, fd, fzf (search tools)
- eza, bat, zoxide (modern CLI replacements)
- starship (prompt)

**Applications:**

- WezTerm

**Fonts:**

- JetBrains Mono Nerd Font
- Fira Code Nerd Font

## Post-Installation

### Install Zsh Plugins

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Reload Shell

```bash
source ~/.zshrc
```

## Updating

Pull the latest changes and re-run the install script:

```bash
cd ~/dotfiles
git pull
./install.sh
```

## Customization

### Adding New Configs

1. Add your config to the appropriate directory in `config/`
2. Update `install.sh` to create the symlink
3. Add any new dependencies to `Brewfile`

### Local Overrides

Create a `~/.zshrc.local` file for machine-specific settings (not tracked in git).

## License

MIT
