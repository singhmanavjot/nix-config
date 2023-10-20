{ inputs, lib, pkgs, ... }: {
  imports = [
    ./qt-style.nix
    ../services/networkmanager.nix
  ];

  environment.systemPackages = with pkgs; [
    celluloid
    gnomeExtensions.media-controls
    gnomeExtensions.wireguard-vpn-extension
    gnomeExtensions.tailscale-status
    gnome.gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.system-monitor
    networkmanager_strongswan
  ];

  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;

        autoLogin = {
          enable = true;
          user = "manav";
        };
      };

      desktopManager.gnome.enable = true;
    };
  };

  xdg.portal.wlr.enable = true;

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };
}
