{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;

    settings = {
      flavour = "mocha";

      # https://github.com/catppuccin/nvim?tab=readme-ov-file#integrations
      integrations = {
        fidget = true;
        lsp_saga = true;
        markview = false;
        lsp_trouble = true;
        which_key = true;
        noice = true;
        harpoon = true;
        snacks.enabled = true;
      };

      term_colors = true;
      transparent_background = true;
    };
  };
}
