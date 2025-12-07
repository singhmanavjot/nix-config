{
  hostname,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.nix-index-database.darwinModules.nix-index
    inputs.sops-nix.darwinModules.sops
    ./${hostname}
    ./_mixins/nix
    ./_mixins/system
    ./_mixins/homebrew
  ];
}
