{ config, lib, pkgs, ... }: {
  #https://nixos.wiki/wiki/Podman

  environment.systemPackages = with pkgs; [
    kind
  ];

  virtualisation.docker.enable = true;
}
