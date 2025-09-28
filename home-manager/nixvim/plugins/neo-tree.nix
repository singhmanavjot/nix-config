{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      closeIfLastWindow = true;
      popupBorderStyle = "rounded";

      filesystem = {
        followCurrentFile.enabled = true;

        filteredItems = {
          hideHidden = false;
          hideByName = [
            ".DS_Store"
          ];
        };
      };
    };

    keymaps = [
      {
        mode = [ "n" ];
        key = "<C-n>";
        action = "<cmd>Neotree toggle<cr>";
        options = {
          desc = "Toggle Neotree";
        };
      }
    ];
  };
}
