{ config, desktop, lib, pkgs, ... }:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  # Only include desktop components if one is supplied.
  imports = [ ] ++ lib.optional (builtins.isString desktop) ./desktop.nix;

  users.users.manav = {
    description = "Manavjot Singh";
    extraGroups = [ "audio" "networkmanager" "users" "video" "wheel" ] ++ ifExists [ "docker" ];
    homeMode = "0755";
    isNormalUser = true;
    packages = [ pkgs.home-manager ];
    shell = pkgs.zsh;
  };
}
