# Neovim Configuration

This repository contains my personal Neovim configuration.

## Prerequisites

Make sure the following are installed:

- Git
- Neovim (latest stable recommended)

## Installation

Clone this repository directly into your Neovim configuration directory:

```bash
git clone git@github.com:MrReal-dev/nvim.git ~/.config/nvim
```

If `~/.config/nvim` already exists, remove or rename it first:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

Then clone:

```bash
git clone git@github.com:MrReal-dev/nvim.git ~/.config/nvim
```

## First Launch

Start Neovim:

```bash
nvim
```

On the first launch, your plugin manager should automatically install the configured plugins. Wait for the installation to finish, then restart Neovim if prompted.

## Updating

To update the configuration later:

```bash
cd ~/.config/nvim
git pull
```
> [!IMPORTANT] 
> System Dependencies is important so your nvim setup as ide to work perfectly... else is your choice

## System Dependencies

The following system tools are used by this Neovim configuration:

- Git
- ripgrep
- fd
- fzf
- lazygit
- Nerd Font
- wl-clipboard (Wayland)


Enjoy!
