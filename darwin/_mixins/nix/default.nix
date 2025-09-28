{
  pkgs,
  lib,
  hostname,
  platform,
  outputs,
  ...
}:
{
  # Nix configuration ------------------------------------------------------------------------------
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "${platform}";
    overlays = [
      outputs.overlays.stable-packages
    ];
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";

      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
        "https://devenv.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];

      # Recommended when using `direnv` etc.
      keep-derivations = true;
      keep-outputs = true;
    };

  };

  # Shells -----------------------------------------------------------------------------------------

  # Add shells installed by nix to /etc/shells file
  environment.shells = with pkgs; [
    bashInteractive
    zsh
  ];

  # Make zsh the default shell
  programs = {
    zsh.enable = true;
    nix-index.enable = true;
    nix-index-database.comma.enable = true;
  };
  environment.variables.SHELL = "${pkgs.zsh}/bin/zsh";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Machine-specific configuration
  networking = {
    hostName = hostname;
    computerName = hostname;
  };
}
