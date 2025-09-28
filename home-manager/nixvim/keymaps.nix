{
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      # Window navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-W>h";
        options = {
          silent = true;
          desc = "Navigate left";
        };
      }

      {
        mode = "n";
        key = "<C-l>";
        action = "<C-W>l";
        options = {
          silent = true;
          desc = "Navigate right";
        };
      }

      {
        mode = "n";
        key = "<C-k>";
        action = "<C-W>k";
        options = {
          silent = true;
          desc = "Navigate up";
        };
      }

      {
        mode = "n";
        key = "<C-j>";
        action = "<C-W>j";
        options = {
          silent = true;
          desc = "Navigate down";
        };
      }

      # Swap between last two buffers
      {
        mode = "n";
        key = "<leader>'";
        action = "<C-^>";
        options = {
          silent = true;
          desc = "Switch to last buffer";
        };
      }

      # Save
      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<cr><esc>";
        options = {
          silent = true;
          desc = "Save current buffer";
        };
      }

      # Quit
      {
        mode = "n";
        key = "<leader>qq";
        action = "<cmd>quitall<cr><esc>";
        options = {
          silent = true;
          desc = "Quit all buffers";
        };
      }

      # Center buffer while navigating
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options = {
          silent = true;
          desc = "Scroll up and center cursor";
        };
      }

      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options = {
          silent = true;
          desc = "Scroll down and center cursor";
        };
      }

      {
        mode = "n";
        key = "{";
        action = "{zz";
        options = {
          silent = true;
          desc = "Jump to previous paragraph and center";
        };
      }

      {
        mode = "n";
        key = "}";
        action = "}zz";
        options = {
          silent = true;
          desc = "Jump to next paragraph and center";
        };
      }

      {
        mode = "n";
        key = "N";
        action = "Nzz";
        options = {
          silent = true;
          desc = "Search previous and center";
        };
      }

      {
        mode = "n";
        key = "n";
        action = "nzz";
        options = {
          silent = true;
          desc = "Search next and center";
        };
      }

      {
        mode = "n";
        key = "G";
        action = "Gzz";
        options = {
          silent = true;
          desc = "Go to end of file and center";
        };
      }

      {
        mode = "n";
        key = "gg";
        action = "ggzz";
        options = {
          silent = true;
          desc = "Go to beginning of file and center";
        };
      }

      {
        mode = "n";
        key = "gd";
        action = "gdzz";
        options = {
          silent = true;
          desc = "Go to definition and center";
        };
      }

      {
        mode = "n";
        key = "<C-i>";
        action = "<C-i>zz";
        options = {
          silent = true;
          desc = "Jump forward in jump list and center";
        };
      }

      {
        mode = "n";
        key = "<C-o>";
        action = "<C-o>zz";
        options = {
          silent = true;
          desc = "Jump backward in jump list and center";
        };
      }

      {
        mode = "n";
        key = "%";
        action = "%zz";
        options = {
          silent = true;
          desc = "Jump to matching bracket and center";
        };
      }

      {
        mode = "n";
        key = "*";
        action = "*zz";
        options = {
          silent = true;
          desc = "Search for word under cursor and center";
        };
      }

      {
        mode = "n";
        key = "#";
        action = "#zz";
        options = {
          silent = true;
          desc = "Search backward for word under cursor and center";
        };
      }

      # Quick find/replace for word under cursor
      {
        mode = "n";
        key = "S";
        action.__raw = ''
          function()
          	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
          	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
          	vim.api.nvim_feedkeys(keys, "n", false)
          end
        '';
        options = {
          silent = true;
          desc = "Quick find/replace word under cursor";
        };
      }

      # Jump to start/end of line
      {
        mode = [
          "n"
          "v"
        ];
        key = "L";
        action = "$";
        options = {
          silent = true;
          desc = "Jump to end of line";
        };
      }

      {
        mode = [
          "n"
          "v"
        ];
        key = "H";
        action = "^";
        options = {
          silent = true;
          desc = "Jump to beginning of line";
        };
      }

      # Redo last change
      {
        mode = "n";
        key = "U";
        action = "<C-r>";
        options = {
          silent = true;
          desc = "Redo last change";
        };
      }

      # Turn off highlighted search results
      {
        mode = "n";
        key = "<leader>no";
        action = "<cmd>noh<cr>";
        options = {
          silent = true;
          desc = "Toggle search highlighting";
        };
      }

      # Quickfix navigation
      {
        mode = "n";
        key = "<leader>cn";
        action = ":cnext<cr>zz";
        options = {
          silent = true;
          desc = "Next quickfix item and center";
        };
      }

      {
        mode = "n";
        key = "<leader>cp";
        action = ":cprevious<cr>zz";
        options = {
          silent = true;
          desc = "Previous quickfix item and center";
        };
      }

      {
        mode = "n";
        key = "<leader>co";
        action = ":copen<cr>zz";
        options = {
          silent = true;
          desc = "Open quickfix list and center";
        };
      }

      {
        mode = "n";
        key = "<leader>cc";
        action = ":cclose<cr>zz";
        options = {
          silent = true;
          desc = "Close quickfix list";
        };
      }

      # Move selected block
      {
        mode = "v";
        key = "<A-j>";
        action = ":m '>+1<CR>gv=gv";
        options = {
          silent = true;
          desc = "Move selected block down";
        };
      }

      {
        mode = "v";
        key = "<A-k>";
        action = ":m '>-2<CR>gv=gv";
        options = {
          silent = true;
          desc = "Move selected block up";
        };
      }

      # Indents the selected visual block to the left/right and reselects it
      {
        mode = "x";
        key = "<<";
        action.__raw = ''
          function()
          	vim.cmd("normal! <<")
          	vim.cmd("normal! gv")
          end
        '';
        options = {
          silent = true;
          desc = "Move selected block up";
        };
      }

      {
        mode = "x";
        key = ">>";
        action.__raw = ''
          function()
          	vim.cmd("normal! >>")
          	vim.cmd("normal! gv")
          end
        '';
        options = {
          silent = true;
          desc = "Move selected block up";
        };
      }

      # Paste stuff without saving the deleted word into the buffer
      {
        mode = "x";
        key = "<leader>p";
        action = ''"_dP'';
        options = {
          silent = true;
          desc = "Deletes to void register and paste over";
        };
      }

      # Exit terminal mode in the builtin terminal
      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
        options = {
          silent = true;
          desc = "Exit terminal mode";
        };
      }
    ];
  };
}
