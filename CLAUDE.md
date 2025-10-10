# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Project Overview

This is a personal Nix configuration monorepo that manages system
configurations for macOS using nix-darwin and home-manager. The repository
follows a modular structure with separate configurations for Darwin (macOS)
system-level settings and home-manager user-level configurations.

## Key Development Commands

### Build System

- `nh darwin build .` - Build Darwin configuration without applying changes
- `nh darwin switch .` - Build and apply Darwin configuration changes
- `darwin-rebuild build --flake .` - Alternative build command for Darwin
- `darwin-rebuild switch --flake .` - Alternative switch command for Darwin

### Testing and Validation

- `nix flake check` - Validate flake configuration and check for errors
- `devenv test` - Run the test suite as defined in devenv.nix (builds both
  Darwin and NixOS variants)

### Development Environment

- `devenv shell` - Enter development shell with all required tools
- `devenv up` - Start development services

### Linting and Formatting

Pre-commit hooks are configured and will run automatically on commit:

- `nixfmt-rfc-style` - Format Nix files
- `deadnix` - Remove dead Nix code (with auto-edit enabled)
- `statix` - Lint Nix code for best practices
- `actionlint` - Lint GitHub Actions
- `prettier` - Format YAML, JSON, and Markdown files
- `markdownlint` - Lint Markdown files

## Architecture Overview

### Core Structure

The repository is organized into three main directories:

1. **`darwin/`** - macOS system-level configuration
   - Contains nix-darwin modules for system settings
   - Organized with mixins pattern for modular configuration
   - Includes Homebrew integration for GUI applications

2. **`home-manager/`** - User-level configuration
   - Contains home-manager modules for user environment
   - Includes dotfiles, shell configuration, and application settings
   - Features a comprehensive Nixvim configuration

3. **`lib/`** - Helper functions and utilities
   - Contains `mkDarwin` helper for creating Darwin configurations
   - Centralizes common patterns and specialArgs handling

### Configuration Flow

1. `flake.nix` defines inputs and outputs, creating Darwin configurations via `lib/helpers.nix`
2. `darwin/default.nix` imports system modules and the specific hostname configuration
3. Home-manager is integrated as a Darwin module, importing `home-manager/default.nix`
4. The modular structure allows selective importing of functionality

### Key Modules

- **Darwin Mixins** (`darwin/_mixins/`):
  - `system/` - macOS system preferences and keyboard settings
  - `homebrew/` - GUI application management via Homebrew
  - `nix/` - Nix daemon and system configuration

- **Home-manager Modules** (`home-manager/`):
  - `nixvim/` - Complete Neovim configuration with plugins, keymaps, and LSP
  - `ghostty/` - Terminal emulator configuration
  - `tmux/` - Terminal multiplexer setup with custom config
  - Shell configurations (zsh, starship) and development tools

### Development Tools Integration

The configuration includes comprehensive tooling for:

- **DevOps**: kubectl, helm, terraform, docker, kind, etc.
- **Security**: trivy, cosign, syft, age, sops
- **Development**: Multiple language servers, formatters, and linters
- **System utilities**: bat, ripgrep, fd, fzf, lazygit, etc.

## Important Notes

### Secrets Management

- Uses SOPS for secrets encryption with age keys
- Secrets are stored in `secrets/secrets.yaml`
- Age key file location: `$HOME/.config/sops/age/keys.txt`

### Platform Considerations

- Designed primarily for Apple Silicon (aarch64-darwin)
- Homebrew integration includes Rosetta support for x86 applications
- Home-manager and Darwin configurations are tightly integrated

### Flake Management

- Uses flake-utils patterns for cross-platform support
- Dependencies are pinned with explicit follows for input consistency
- Regular updates should be done via `nix flake update`

### Testing Strategy

The devenv.nix test command validates both Darwin and NixOS builds to ensure
cross-platform compatibility, even though this is primarily a Darwin
configuration.
