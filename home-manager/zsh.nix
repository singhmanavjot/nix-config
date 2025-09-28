{
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "df48366e858feec2f770b48a7d92b56eab613396";
          sha256 = "sha256-oQpYKBt0gmOSBgay2HgbXiDoZo5FoUKwyHSlUrOAP5E=";
        };
      }
      {
        name = "you-should-use";
        file = "you-should-use.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "MichaelAquilina";
          repo = "zsh-you-should-use";
          rev = "1f9cb008076d4f2011d5f814dfbcfbece94a99e0";
          sha256 = "sha256-lKs6DhG3x/oRA5AxnRT+odCZFenpS86wPnPqxLonV2E=";
        };
      }
    ];

    sessionVariables = {
      YSU_MESSAGE_POSITION = "after";
      YSU_HARDCORE = 1;
    };

    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "1password"
        "ansible"
        "brew"
        "direnv"
        "docker"
        "gcloud"
        "git"
        "helm"
        "kind"
        "kubectl"
        "minikube"
        "pre-commit"
        "rsync"
        "sudo"
        "terraform"
        "tmux"
      ];
      extraConfig = ''
        zstyle ':completion:*:*:docker:*' option-stacking yes
        zstyle ':completion:*:*:docker-*:*' option-stacking yes
      '';
    };

    shellAliases = {
      nhds = "nh darwin switch --ask ~/workspace/github.com/singhmanavjot/nix-config";
      cat = "bat";
      grep = "rg";
      find = "fd";
      cpwd = "pwd | pbcopy";
      kx = "kubectx";
      kxu = "kubectx -u";
      lg = "lazygit";
      ldo = "lazydocker";

      kicc3 = "kind create cluster --config ~/.config/kind-custom/config.yaml";

      k8s-netshoot = "kubectl run tmp-shell --rm -i --tty --image nicolaka/netshoot";

      dev-tag = "echo \"dev-$(date +'%Y%m%d%H%M')\"";

      work = "pomodoro 'work'";
      br = "pomodoro 'break'";
    };

    initContent = ''
      declare -A pomo_options
      pomo_options["work"]="45"
      pomo_options["break"]="10"

      pomodoro () {
        if [ -n "$1" ] && [ -n "$''\{pomo_options["$1"]}" ]; then
        val=$1
        echo "$val" | lolcat
        timer "$''\{pomo_options["$val"]}"m
        say "'$val' session done"
        fi
      }
    '';
  };
}
