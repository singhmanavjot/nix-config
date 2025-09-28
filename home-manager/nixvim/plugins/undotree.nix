{
  programs.nixvim = {
    plugins.undotree.enable = true;

    keymaps = [
      {
        mode = "n";
        key = "<leader>ut";
        action = ":UndotreeToggle<CR>";
        options = {
          desc = "Toggle UndoTree";
          silent = true;
        };
      }
    ];
  };
}
