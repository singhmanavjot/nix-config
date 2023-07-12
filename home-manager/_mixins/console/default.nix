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
      dconf2nix # Nix code from Dconf files
      nixpkgs-fmt # Code format Nix
      kubectl # Kubernetes CLI
      terraform # Tool for building, changing, and versioning infrastructure
      kustomize # Customization of kubernetes YAML configurations
      kubernetes-helm # A package manager for kubernetes
      ncdu # Disk usage analyzer with an ncurses interface
      exoscale-cli # Command-line tool for everything at Exoscale: compute, storage, dns
      postgresql # A powerful, open source object-relational database system
      python3 # A high-level dynamically-typed programming language
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
