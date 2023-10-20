{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      jnoortheen.nix-ide
      ms-kubernetes-tools.vscode-kubernetes-tools
      shardulm94.trailing-spaces
      redhat.vscode-yaml
      hashicorp.terraform
      github.vscode-github-actions
      esbenp.prettier-vscode
      coder.coder-remote
      ms-vscode-remote.remote-ssh
      ms-azuretools.vscode-docker
      streetsidesoftware.code-spell-checker
      wholroyd.jinja
    ];
    userSettings = {
      "yaml.customTags" = [
        "!vault scalar"
      ];
      "redhat.telemetry.enabled" = false;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "[json]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "workbench.startupEditor" = "none";
      "workbench.iconTheme" = "catppuccin-mocha";
      "ansible.python.interpreterPath" = "/home/manav/.nix-profile/bin/python";
    };
  };
}
