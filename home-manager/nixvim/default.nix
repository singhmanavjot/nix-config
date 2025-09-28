{ ... }:
{
  imports = [
    ./plugins
    ./keymaps.nix
    ./autocommands.nix
    ./options.nix
    ./colorschemes.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
