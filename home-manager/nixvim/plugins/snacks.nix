{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      imagemagick
      ghostscript_headless
      tectonic
      mermaid-cli
      git
      ripgrep
      fd
    ];

    plugins.snacks = {
      enable = true;

      settings = {
        bigfile.enable = true;
        bufdelete.enable = true;
        dim.enable = true;
        gitbrowse.enable = true;
        indent.enable = true;
        input.enable = true;
        notifier.style = "fancy";
        statuscolumn.enable = true;
        toggle.enable = true;
        words.enable = true;
      };
    };

    keymaps = [
      {
        key = "<leader>bd";
        action.__raw = ''
          function()
            Snacks.bufdelete()
          end
        '';
        options.desc = "[B]uffer [D]elete";
      }

      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>og";
        action.__raw = ''
          function()
            Snacks.gitbrowse()
          end
        '';
        options.desc = "[O]pen [G]it";
      }

      {
        key = "<leader>nh";
        action.__raw = ''
          function()
            Snacks.notifier.show_history()
          end
        '';
        options.desc = "[N]otification [H]istory";
      }

      {
        key = "<leader>nd";
        action.__raw = ''
          function()
            Snacks.notifier.hide()
          end
        '';
        options.desc = "[N]otifications [D]ismiss";
      }

      {
        key = "<leader>ln";
        action.__raw = ''
          function()
            Snacks.toggle.option("relativenumber", { name = "Relative Number" }):toggle()
          end
        '';
        options.desc = "Toggle Relative [L]ine [N]umbers";
      }

      {
        key = "<leader>cl";
        action.__raw = ''
          function()
            Snacks.toggle.option("cursorline", { name = "Cursor Line" }):toggle()
          end
        '';
        options.desc = "Toggle [C]ursor [L]ine";
      }

      {
        key = "<leader>td";
        action.__raw = ''
          function()
            Snacks.toggle.diagnostics():toggle()
          end
        '';
        options.desc = "[T]oggle [D]iagnostics";
      }

      {
        key = "<leader>zm";
        action.__raw = ''
          function()
            Snacks.toggle.dim():toggle()
          end
        '';
        options.desc = "Toggle Dim Mode";
      }

      {
        key = "<leader>tw";
        action.__raw = ''
          function()
            Snacks.toggle.option("wrap"):toggle()
          end
        '';
        options.desc = "[T]oggle line [W]rap";
      }

      {
        key = "<leader>tx";
        action.__raw = ''
          function()
            local tsc = require("treesitter-context")
            Snacks.toggle({
              name = "Treesitter Context",
              get = tsc.enabled,
              set = function(state)
                if state then
                  tsc.enable()
                else
                  tsc.disable()
                end
              end,
            }):toggle()
          end
        '';
        options.desc = "Toggle [T]reesitter Conte[x]t";
      }

      {
        key = "<leader>ih";
        action.__raw = ''
          function()
            Snacks.toggle({
              name = "Inlay Hints",
              get = function()
                return vim.lsp.inlay_hint.is_enabled()
              end,
              set = function(state)
                if state then
                  vim.lsp.inlay_hint.enable(true)
                else
                  vim.lsp.inlay_hint.enable(false)
                end
              end,
            }):toggle()
          end
        '';
        options.desc = "Toggle [I]nlay [H]ints";
      }

      {
        key = "<leader>hl";
        action.__raw = ''
          function()
            local hc = require("nvim-highlight-colors")
            Snacks.toggle({
              name = "Highlight Colors",
              get = function()
                return hc.is_active()
              end,
              set = function(state)
                if state then
                  hc.turnOn()
                else
                  hc.turnOff()
                end
              end,
            }):toggle()
          end
        '';
        options.desc = "Toggle [H]igh[L]ight Colors";
      }
    ];
  };
}
