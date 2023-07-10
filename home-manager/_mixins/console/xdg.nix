{ config, lib, ... }:
{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = lib.mkDefault true;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      publicShare = "${config.home.homeDirectory}/public";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/videos";
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/pictures/screenshots";
        XDG_WORKSPACE_DIR = "${config.home.homeDirectory}/workspace";
      };
    };
  };
}
