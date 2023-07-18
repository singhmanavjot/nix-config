{ lib, pkgs, ... }: {
  programs = {
    _1password-gui.enable = true;
    _1password.enable = true;
  };
}
