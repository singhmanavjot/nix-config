{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p1
    ../_mixins/services/pipewire.nix
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ebdd6d72-23d6-4a72-92f0-fd2d9e2fc0cd";
    fsType = "ext4";
  };


  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D2C5-FA45";
    fsType = "vfat";
  };

  console = {
    earlySetup = true;
    # Pixel sizes of the font: 12, 14, 16, 18, 20, 22, 24, 28, 32
    # Followed by 'n' (normal) or 'b' (bold)
    font = "ter-powerline-v28n";
    packages = [ pkgs.terminus_font pkgs.powerline-fonts ];
  };

  hardware = {
    bluetooth = {
      enable = true;
      settings.General.Enable = "Source,Sink,Media,Socket";
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
