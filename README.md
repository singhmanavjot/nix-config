# Nix Configuration

Personal Nix configuration for macOS (nix-darwin) with Home Manager integration.

## Structure

- `darwin/` - macOS system configuration with nix-darwin
- `home-manager/` - User environment configuration
- `lib/` - Helper functions and utilities
- `overlays/` - Package overlays and customizations

## Quick Start

### Prerequisites

1. Install Nix with flakes enabled
2. Install [nh](https://github.com/viperML/nh) for convenient rebuilds

### Build and Apply

```bash
nh darwin switch --ask
```

## Configuration

### System Configuration

The Darwin configuration is located in `darwin/` with host-specific configs:

- `darwin/macbook-air/` - Configuration for the MacBook Air host

### User Environment

Home Manager modules in `home-manager/` include:

- **Shell**: zsh with starship prompt
- **Terminal**: ghostty configuration
- **Editor**: nixvim (Neovim with Nix configuration)
- **Tools**: tmux, btop, yazi, k9s, and more
- **Window Management**: aerospace
- **Development**: git, ssh, and Claude Code integration

## Development

### Linting

```bash
# Nix files
treefmt
statix check
deadnix

# Markdown files
markdownlint **/*.md

# Shell scripts
shellcheck bin/* scripts/* .claude/hooks/*
shfmt -w bin/* scripts/* .claude/hooks/*
shellharden bin/* scripts/* .claude/hooks/*
```

### Testing

```bash
# Flake structure validation
nix flake check

# Build validation (builds but doesn't activate)
nh darwin build .

# Alternative: Direct nix build
nix build .#darwinConfigurations.macbook-air.system

# Direct evaluation test
nix eval .#darwinConfigurations.macbook-air.system >/dev/null
```

## Features

- **Declarative macOS configuration** with nix-darwin
- **User environment management** with Home Manager
- **Homebrew integration** via nix-homebrew
- **Custom Neovim setup** with nixvim
- **Development tools** and shell configuration
- **Window management** with aerospace
- **Terminal multiplexing** with tmux and tmuxinator

## Hosts

- `macbook-air` - Primary macOS configuration

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE)
file for details.
