{
  description = "NixOS and Home Manager Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }@inputs:
    let
      inherit (self) outputs;
      # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
      stateVersion = "23.05";
      libx = import ./lib { inherit inputs outputs stateVersion; };
    in
    {
      # home-manager switch -b backup --flake $HOME/.config/nix-config
      # nix build .#homeConfigurations."manav@p1g5".activationPackage
      homeConfigurations = {
        "manav@p1g5" = libx.mkHome { hostname = "p1g5"; username = "manav"; desktop = "gnome"; };
      };
      nixosConfigurations = {
        # sudo nixos-rebuild switch --flake $HOME/.config/nix-config
        # nix build .#nixosConfigurations.p1g5.config.system.build.toplevel
        p1g5 = libx.mkHost { hostname = "p1g5"; username = "manav"; desktop = "gnome"; };
      };
    };
}
