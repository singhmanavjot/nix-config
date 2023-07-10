{ lib, pkgs, ... }: {
  programs = {
    firefox = {
      enable = lib.mkDefault true;
      languagePacks = [ "en-US" ];
    };
  };
}
