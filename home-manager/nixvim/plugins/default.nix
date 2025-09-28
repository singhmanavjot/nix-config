{ ... }:
{
  imports = [
    ./blink-cmp.nix
    ./cloak.nix
    ./harpoon.nix
    ./lsp.nix
    ./lspsaga.nix
    ./lualine.nix
    ./mini.nix
    ./neo-tree.nix
    ./none-ls.nix
    ./nvim-ufo.nix
    ./oil.nix
    ./snacks.nix
    ./telescope.nix
    ./tmux-navigator.nix
    ./toggleterm.nix
    ./treesitter.nix
    ./undotree.nix
    ./whitespace.nix
  ];

  programs.nixvim.plugins = {
    comment.enable = true;
    gitsigns.enable = true;
    highlight-colors.enable = true;
    lz-n.enable = true;
    markview.enable = true;
    noice.enable = true;
    nvim-autopairs.enable = true;
    todo-comments.enable = true;
    ts-autotag.enable = true;
    vim-surround.enable = true;
    which-key.enable = true;
  };
}
