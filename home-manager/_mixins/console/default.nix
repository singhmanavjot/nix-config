{ pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./git.nix
    ./neofetch.nix
    ./xdg.nix
  ];

  home = {
    # A Modern Unix experience
    # https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/
    packages = with pkgs; [
      dconf2nix
      nixpkgs-fmt
      kubectl
      terraform
      kustomize
      kubernetes-helm
      ncdu
      exoscale-cli
      postgresql
      wireguard-tools
      kuttl
      gnumake
      chart-testing
      kubeseal
      kubectx
      mysql80
      ansible
      ansible-lint
      python3
      vagrant
      pre-commit
      yamllint
      go-task
      gatekeeper
      yq-go
      kics
    ];

    sessionVariables = {
      EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batwatch
        prettybat
      ];
    };
    btop.enable = true;
    dircolors = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };
    eza = {
      enable = true;
      enableAliases = true;
      icons = true;
    };
    gpg.enable = true;
    home-manager.enable = true;
    jq.enable = true;
    k9s.enable = true;
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        palette = "catppuccin_mocha";
        kubernetes = {
          disabled = false;
          symbol = "󱃾 ";
          # format = "on [⛵ ($user on )($cluster in )$context \($namespace\)](dimmed green) ";
        };
      } // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          } + /palettes/mocha.toml));
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryFlavor = "curses";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
