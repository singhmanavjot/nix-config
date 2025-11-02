{
  programs = {
    gh.enable = true;
    git = {
      enable = true;
      settings = {
        user = {
          email = "64074588+singhmanavjot@users.noreply.github.com";
          name = "Manavjot Singh";
          signingkey = "~/.ssh/github_signing_key.pub";
        };
        gpg.format = "ssh";
        commit.gpgsign = true;
        tag.gpgsign = true;
        alias = {
          lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        };
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

    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        features = "decorations";
        navigate = true;
        side-by-side = true;
      };
    };
  };
}
