{ config, desktop, pkgs, ... }: {
  imports = [
    ./celluloid.nix
    ./dconf-editor.nix
    ./emote.nix
    ./meld.nix
    ./vscode.nix
    # (./. + "/${desktop}.nix")
  ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    work-sans
    joypixels
  ];
  # Accept the joypixels license
  nixpkgs.config.joypixels.acceptLicense = true;
}
