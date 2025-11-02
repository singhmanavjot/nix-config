{ pkgs, ... }:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components;
    [
      gke-gcloud-auth-plugin
    ]
  );
in
{
  imports = [
    ./aerospace.nix
    ./btop.nix
    ./ghostty
    ./git.nix
    ./k9s.nix
    ./kind
    ./nixvim
    ./sops.nix
    ./ssh.nix
    ./starship.nix
    ./tmux
    ./yazi.nix
    ./zsh.nix
    ./claude-code.nix
  ];

  home = {
    packages = with pkgs; [
      # linter & formater & lsp
      ansible-lint
      dotenv-linter
      hadolint
      kubeconform
      markdownlint-cli
      nil
      nixd
      nixfmt-rfc-style
      nixfmt-tree
      shellcheck
      shfmt
      terraform-docs
      tflint
      yamllint
      statix
      deadnix
      shellharden

      # devops stuff
      # grype
      # vexctl
      chart-testing
      cloud-provider-kind
      colima
      stable.cosign
      docker
      docker-credential-helpers
      gdk
      kind
      kpt
      kube-capacity
      kubectl
      kubectl-tree
      kubectx
      kubernetes-helm
      kubeseal
      kustomize
      kyverno
      minikube
      opentofu
      syft
      talosctl
      terraform
      trivy

      # misc
      _1password-cli
      age
      ansible
      cmctl
      devenv
      gdu
      glab
      glow
      go-task
      lolcat
      mkcert
      nss_latest.tools
      pre-commit
      python3
      qemu
      sops
      tailspin
      timer
      yq-go
      unixtools.watch
      gping
      tree
      ast-grep
      renovate
    ];

    sessionVariables = {
      EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
    };

    stateVersion = "23.05";
  };

  programs = {
    nh.enable = true;
    bat = {
      enable = true;
      config = {
        theme = "catppuccin-mocha";
        style = "plain";
        paging = "never";
      };
      themes = {
        catppuccin-mocha = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
            sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
          };
          file = "Catppuccin-mocha.tmTheme";
        };
      };
    };
    ripgrep.enable = true;
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
      icons = "auto";
    };
    jq.enable = true;
    fd.enable = true;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    lazygit = {
      enable = true;
      settings = {
        customCommands = [
          {
            key = "G";
            command = ''
              git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
            '';
            context = "localBranches";
            description = "Prune local branches no longer on its remote; (G)one.";
            loadingText = "Pruning gone...";
          }
        ];
      };
    };
    lazydocker.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions = [
        # https://github.com/catppuccin/fzf Mocha
        "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8"
        "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
        "--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
        "--color=selected-bg:#45475a"
        "--color=border:#313244,label:#cdd6f4"
      ];
    };
  };

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        trim_trailing_whitespace = true;
        insert_final_newline = true;
        # indent_style = "space";
        # indent_size = 2;
      };
      "*.md" = {
        indent_style = "tab";
        trim_trailing_whitespace = false;
      };
    };
  };
}
