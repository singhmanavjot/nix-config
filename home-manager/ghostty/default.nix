{ pkgs, ... }:
{
  home.file = {
    ".config/ghostty/config".source = ./config;
  };

  programs.ghostty.enable = true;
  # default package is marked as broken
  programs.ghostty.package = pkgs.ghostty-bin;
}
