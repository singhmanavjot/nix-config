{ desktop, lib, ... }: {
  imports = [
    ./distrobox.nix
    ./docker.nix
  ]
  ++ lib.optional (builtins.isString desktop) ./quickemu.nix;
}
