{ hostname, lib, pkgs, username, ... }: {
  imports = [
    ./locale.nix
    ../services/firewall.nix
    ../services/fwupd.nix
    ../services/openssh.nix
  ];


  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];

  # Use passed hostname to configure basic networking
  networking = {
    hostName = hostname;
    useDHCP = lib.mkDefault true;
  };

  programs = {
    command-not-found.enable = false;
    zsh = {
      enable = true;
      shellAliases = {
        nix-gc = "sudo nix-collect-garbage --delete-older-than 14d";
        rebuild-home = "home-manager switch -b backup --flake $HOME/.config/nix-config";
        rebuild-host = "sudo nixos-rebuild switch --flake $HOME/.config/nix-config";
        rebuild-lock = "pushd $HOME/.config/nix-config && nix flake lock --recreate-lock-file && popd";
        nix-config = "code $HOME/.config/nix-config";
      };
    };
  };

  security.rtkit.enable = true;
}
