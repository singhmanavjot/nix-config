{
  programs.nixvim = {
    plugins.lspsaga = {
      enable = true;

      settings = {
        ui.border = "rounded";
        codeAction = {
          showServerName = true;
          keys = {
            quit = [
              "<Esc>"
              "q"
            ];
          };
        };
        lightbulb.enable = false;
        rename.keys.quit = [
          "<C-k>"
          "<Esc>"
        ];
      };
    };

    keymaps = [
      # Rename
      {
        mode = "n";
        key = "<leader>rn";
        action = "<cmd>Lspsaga rename<CR>";
        options.desc = "Lspsaga: Rename symbol";
      }

      # Code Action
      {
        mode = "n";
        key = "<leader>ca";
        action = "<cmd>Lspsaga code_action<CR>";
        options.desc = "Lspsaga: Code action";
      }

      # Definition
      {
        mode = "n";
        key = "gd";
        action = "<cmd>Lspsaga goto_definition<CR>";
        options.desc = "Lspsaga: Go to definition";
      }

      {
        mode = "n";
        key = "td";
        action = "<cmd>Lspsaga peek_type_definition<CR>";
        options.desc = "Lspsaga: Type definition";
      }

      # Hover
      {
        mode = "n";
        key = "K";
        action = "<cmd>Lspsaga hover_doc<CR>";
        options.desc = "Lspsaga: Hover documentation";
      }

      # Diagnostics
      {
        mode = "n";
        key = "]d";
        action.__raw = ''
          function()
          	local ok = pcall(function() require("lspsaga.diagnostic"):goto_next() end)
          	if ok then
          		vim.api.nvim_feedkeys("zz", "n", false)
          	end
          end
        '';
        options.desc = "Go to next diagnostic and center";
      }

      {
        mode = "n";
        key = "[d";
        action.__raw = ''
          function()
          	local ok = pcall(function() require("lspsaga.diagnostic"):goto_prev() end)
          	if ok then
          		vim.api.nvim_feedkeys("zz", "n", false)
          	end
          end
        '';
        options.desc = "Go to previous diagnostic and center";
      }

      {
        mode = "n";
        key = "]e";
        action.__raw = ''
          function()
          	local ok = pcall(function() require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR }) end)
          	if ok then
          		vim.api.nvim_feedkeys("zz", "n", false)
          	end
          end
        '';
        options.desc = "Go to next error diagnostic and center";
      }

      {
        mode = "n";
        key = "[e";
        action.__raw = ''
          function()
          	local ok = pcall(function() require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR }) end)
          	if ok then
          		vim.api.nvim_feedkeys("zz", "n", false)
          	end
          end
        '';
        options.desc = "Go to previous error diagnostic and center";
      }

      {
        mode = "n";
        key = "]w";
        action.__raw = ''
          function()
          	local ok = pcall(function() require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.WARN }) end)
          	if ok then
          		vim.api.nvim_feedkeys("zz", "n", false)
          	end
          end
        '';
        options.desc = "Go to next warning diagnostic and center";
      }

      {
        mode = "n";
        key = "[w";
        action.__raw = ''
          function()
          	local ok = pcall(function() require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARN }) end)
          	if ok then
          		vim.api.nvim_feedkeys("zz", "n", false)
          	end
          end
        '';
        options.desc = "Go to previous warning diagnostic and center";
      }

      {
        mode = "n";
        key = "<leader>d";
        action = "<cmd>Lspsaga show_workspace_diagnostics ++float<CR>";
        options.desc = "Open diagnostic float";
      }
    ];
  };
}
