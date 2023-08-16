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
    exa = {
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
        kubernetes = {
          disabled = false;
        };
      };
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
