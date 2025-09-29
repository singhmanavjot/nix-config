{
  inputs,
  outputs,
  ...
}:
{
  mkDarwin =
    {
      hostname,
      username,
      platform ? "aarch64-darwin",
    }:
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit
          inputs
          outputs
          hostname
          platform
          username
          ;
      };

      modules = [
        ../darwin

        inputs.home-manager.darwinModules.home-manager
        {
          users.users.${username}.home = "/Users/${username}";
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${username} = {
              imports = [
                ../home-manager
                inputs.nixvim.homeModules.nixvim
                inputs.mac-app-util.homeManagerModules.default
                inputs.sops-nix.homeManagerModules.sops
              ];
            };
            extraSpecialArgs = {
              inherit
                inputs
                outputs
                hostname
                platform
                username
                ;
            };
          };
        }
      ];
    };
}
