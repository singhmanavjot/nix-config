{ ... }: {
  imports = [
    ../_mixins/services/tailscale.nix
    ../_mixins/virt
  ];
}
