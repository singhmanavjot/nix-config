{ config, desktop, inputs, lib, outputs, pkgs, stateVersion, username, ... }:
let
  inherit (pkgs.stdenv) isDarwin isLinux;
in
{
  imports = [ ./_mixins/console ]
    ++ lib.optional (builtins.isString desktop) ./_mixins/desktop
    ++ lib.optional (builtins.isPath (./. + "/_mixins/users/${username}")) ./_mixins/users/${username};

  home = {
    username = username;
    homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
    sessionPath = [ "$HOME/.local/bin" ];
    stateVersion = stateVersion;
  };

  nixpkgs.config = {
    allowUnfree = true;
    # Workaround for https://github.com/nix-community/home-manager/issues/2942
    allowUnfreePredicate = (_: true);
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };
}
