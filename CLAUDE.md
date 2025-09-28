# Claude Code Configuration for Nix Config

## Commands

### Build

```bash
nh darwin switch --ask
```

### Lint

```bash
# Nix files
treefmt
statix check
deadnix

# Markdown files
markdownlint **/*.md

# Shell scripts (by directory)
shellcheck bin/* scripts/* .claude/hooks/*
shfmt -w bin/* scripts/* .claude/hooks/*
shellharden bin/* scripts/* .claude/hooks/*
```

### Test

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

## Project Settings

- **Languages**: Nix, Markdown, Shell scripts
- **Primary tools**: treefmt, nixfmt, statix, deadnix, markdownlint,
  shellcheck, shfmt, shellharden, nh
- **Config type**: NixOS/Darwin flake configuration
- **Script directories**: bin/, scripts/, .claude/hooks/
