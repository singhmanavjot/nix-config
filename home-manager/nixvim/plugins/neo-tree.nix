{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      settings = {
        close_if_last_window = true;
        popup_border_style = "rounded";

        filesystem = {
          follow_current_file = {
            enabled = true;
          };

          filtered_items = {
            hide_hidden = false;
            hide_by_name = [
              ".DS_Store"
            ];
          };
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
