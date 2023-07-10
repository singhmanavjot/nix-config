{ pkgs, ... }: {
  imports = [
    ../../desktop/firefox.nix
  ];

  environment.systemPackages = with pkgs; [
    authy
    slack
    zoom-us
    discord
    vscode
    gnome.dconf-editor
    meld
    signal-desktop
    obsidian
  ];
}
