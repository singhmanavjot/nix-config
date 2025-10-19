{
  programs = {
    gh.enable = true;
    git = {
      enable = true;
      userEmail = "64074588+singhmanavjot@users.noreply.github.com";
      userName = "Manavjot Singh";
      extraConfig = {
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/github_signing_key.pub";
        commit.gpgsign = true;
        tag.gpgsign = true;
      };

      delta = {
        enable = true;
        options = {
          features = "decorations";
          navigate = true;
          side-by-side = true;
        };
      };

      aliases = {
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      };

      extraConfig = {
        push = {
          default = "matching";
        };
        pull = {
          rebase = true;
        };
        init = {
          defaultBranch = "main";
        };
      };

      ignores = [
        "*.log"
        "*.out"
        ".DS_Store"
        "bin/"
        "dist/"
        "result"
        ".envrc"
        ".direnv"
        "kubeconfig"
        "CLAUDE.local.md"
        "devenv.local.nix"
      ];
    };
  };
}
