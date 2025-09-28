{
  programs = {
    gh.enable = true;
    git = {
      enable = true;
      userEmail = "64074588+singhmanavjot@users.noreply.github.com";
      userName = "Manavjot Singh";
      extraConfig = {
        gpg.format = "ssh";
        user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILmtEIi5l8ZGQY/xhY9WFeJ8Poeq/cRJW3QAXSAYShyV";
        commit.gpgsign = true;
        tag.gpgsign = true;
        gpg.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
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
