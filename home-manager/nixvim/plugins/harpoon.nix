{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>ho";
        action.__raw = ''
          function()
            harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end
        '';
        options.desc = "Toggle Harpoon quick menu";
      }

      {
        mode = "n";
        key = "<leader>ha";
        action.__raw = ''
          function()
            harpoon = require("harpoon")
            harpoon:list():add()
          end
        '';
        options.desc = "Add current file to Harpoon";
      }

      {
        mode = "n";
        key = "<leader>hd";
        action.__raw = ''
          function()
            harpoon = require("harpoon")
            harpoon:list():remove()
          end
        '';
        options.desc = "Delete current file from Harpoon";
      }

      {
        mode = "n";
        key = "<leader>hc";
        action.__raw = ''
          function()
            harpoon = require("harpoon")
            harpoon:list():clear()
          end
        '';
        options.desc = "Clear all Harpoon marks";
      }

      {
        mode = "n";
        key = "<leader>1";
        action.__raw = ''
          function()
            harpoon = require("harpoon")
            harpoon:list():select(1)
          end
        '';
        options.desc = "Navigate to Harpoon file 1";
      }

      {
        mode = "n";
        key = "<leader>2";
        action.__raw = ''
          function()
            harpoon = require("harpoon")
            harpoon:list():select(2)
          end
        '';
        options.desc = "Navigate to Harpoon file 2";
      }

      {
        mode = "n";
        key = "<leader>3";
        action.__raw = ''
          function()
            harpoon = require("harpoon")
            harpoon:list():select(3)
          end
        '';
        options.desc = "Navigate to Harpoon file 3";
      }

      {
        mode = "n";
        key = "<leader>4";
        action.__raw = ''
          function()
            harpoon = require("harpoon")
            harpoon:list():select(4)
          end
        '';
        options.desc = "Navigate to Harpoon file 4";
      }

      {
        mode = "n";
        key = "<leader>5";
        action.__raw = ''
          function()
            harpoon = require("harpoon")
            harpoon:list():select(5)
          end
        '';
        options.desc = "Navigate to Harpoon file 5";
      }

    ];
  };
}
