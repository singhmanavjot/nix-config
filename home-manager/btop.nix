{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    # settings = {
    #   color_theme = "catppuccin-mocha";
    # };
    themes = {
      catppuccin-mocha =
        pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "btop";
          rev = "f437574b600f1c6d932627050b15ff5153b58fa3";
          sha256 = "sha256-mEGZwScVPWGu+Vbtddc/sJ+mNdD2kKienGZVUcTSl+c=";
        }
        + /themes/catppuccin_mocha.theme;
    };
  };
}
