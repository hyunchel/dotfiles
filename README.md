# dotfiles
Home of dot files.

## Installation

Run the main `install` script to set up dotfiles:

```bash
./install
```

For Awesome WM setup, run the separate script:

```bash
./install-awesome
```

## Files Used by Main Install Script

The following files and directories are symlinked or copied by the main `install` script:

| File/Directory | Action |
|----------------|--------|
| `zshrc` | Symlinked to `~/.zshrc` |
| `zshenv` | Symlinked to `~/.zshenv` |
| `zsh/` | Symlinked to `~/.zsh` |
| `tmux.conf` | Symlinked to `~/.tmux.conf` |
| `gitignore` | Symlinked to `~/.gitignore` |
| `xinitrc` | Symlinked to `~/.xinitrc` |
| `config/nvim/` | Symlinked to `~/.config/nvim`, then specific files copied via `apply-source` |
| `config/kitty/kitty.conf` | Symlinked to `~/.config/kitty/kitty.conf` |
| `bin/` | Symlinked to `~/bin` |
| `ext/on-modify.timewarrior` | Copied to `~/.task/hooks/` (note: script creates `~/.config/task/hooks` but copies to `~/.task/hooks/`) |
| `gitconfig` | Copied to `~/.gitconfig` |
| `git_template/` | Symlinked to `~/.git_template` |
| `config/hypr/` | Copied via `apply-source` (Linux only) |
| `config/waybar/` | Copied via `apply-source` (Linux only) |

## Files NOT Used by Main Install Script

The following files exist in this repository but are **not** installed by the main `install` script:

### Shell Configurations (Bash)
- `bash_profile` - Bash profile configuration
- `bashrc` - Bash shell configuration

### Vim Configuration
- `vimrc` - Vim configuration (not used; nvim config is used instead)
- `colors/` - Vim color schemes
- `plugin/` - Vim plugins

### Config Directories
- `config/alacritty/` - Alacritty terminal configuration
- `config/awesome/` - Awesome WM configuration (note: `install-awesome` script references a non-existent `awesome/` directory instead of `config/awesome/`)
- `config/fcitx/` - Fcitx input method configuration
- `config/fcitx5/` - Fcitx5 input method configuration
- `config/mycli/` - MySQL CLI configuration
- `config/pgcli/` - PostgreSQL CLI configuration
- `config/spotify-launcher.conf` - Spotify launcher configuration
- `config/wal/` - Pywal color scheme templates
- `config/wofi/` - Wofi launcher configuration
- `config/xmonad/` - XMonad window manager configuration

### Utility Scripts
- `update-source` - Manually sync local config changes back to the repo (reverse of `apply-source`)
