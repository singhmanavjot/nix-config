{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        view_options = {
          show_hidden = true;
          is_always_hidden.__raw = ''
            function(name, bufnr)
              return vim.startswith(name, ".DS_Store")
            end
          '';
        };

        keymaps = {
          "<Esc>" = "actions.close";
        };
      };
    };

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>e";
        action.__raw = ''
          function()
            require("oil").toggle_float()
          end
        '';
        options = {
          desc = "Toggle Oil file explorer";
        };
      }
    ];
  };
}
