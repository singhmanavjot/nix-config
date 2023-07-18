{ lib, pkgs, username, ... }: {
  programs = {
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "${username}" ];
    };
    _1password.enable = true;
  };
}
