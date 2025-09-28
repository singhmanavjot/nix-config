{ pkgs, ... }:
{
  programs.k9s = {
    enable = true;
    settings = {
      k9s = {
        readOnly = false;
      };
    };
    skins = {
      catppuccin-mocha =
        pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "k9s";
          rev = "fdbec82284744a1fc2eb3e2d24cb92ef87ffb8b4";
          sha256 = "sha256-9h+jyEO4w0OnzeEKQXJbg9dvvWGZYQAO4MbgDn6QRzM=";
        }
        + /dist/catppuccin-mocha.yaml;
    };
  };
}
