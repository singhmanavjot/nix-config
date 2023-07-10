{ config, lib, pkgs, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "thunderbolt" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ ];
      luks.devices."luks-c380b93a-c6fb-407c-8e49-c82bf2e44574".device = "/dev/disk/by-uuid/c380b93a-c6fb-407c-8e49-c82bf2e44574";
      secrets."/crypto_keyfile.bin" = null;
    };

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };

      efi.canTouchEfiVariables = true;
      timeout = 3;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
