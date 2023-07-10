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
    ];
  };
}
