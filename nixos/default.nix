{ config, desktop, hostname, inputs, lib, modulesPath, outputs, pkgs, stateVersion, username, ... }: {
  imports = [
    (./. + "/${hostname}/boot.nix")
    (./. + "/${hostname}/hardware.nix")
    (modulesPath + "/installer/scan/not-detected.nix")
    ./_mixins/base
    ./_mixins/users/${username}
  ]
  ++ lib.optional (builtins.pathExists (./. + "/${hostname}/extra.nix")) (import ./${hostname}/extra.nix { })
  ++ lib.optional (builtins.isString desktop) ./_mixins/desktop;

  nixpkgs.config.allowUnfree = true;

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  system.stateVersion = stateVersion;
}
