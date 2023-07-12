{ config, lib, pkgs, ... }: {
  #https://nixos.wiki/wiki/Podman

  environment.systemPackages = with pkgs; [
    kind
    minikube
  ];

  virtualisation.docker.enable = true;
}
