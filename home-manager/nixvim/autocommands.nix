{
  programs.nixvim.autoCmd = [
    # Vertically center document when entering insert mode
    {
      event = "InsertEnter";
      command = "norm zz";
    }

    # Open help in a vertical split
    {
      event = "FileType";
      pattern = "help";
      command = "wincmd L";
    }

    # Close Telescope prompt in insert mode by clicking escape
    {
      event = [ "FileType" ];
      pattern = "TelescopePrompt";
      command = "inoremap <buffer><silent> <ESC> <ESC>:close!<CR>";
    }

    # Highlight yank text
    {
      event = "TextYankPost";
      pattern = "*";
      command = "lua vim.hl.on_yank{timeout=200}";
    }

    # Enter git buffer in insert mode
    {
      event = "FileType";
      pattern = [
        "gitcommit"
        "gitrebase"
      ];
      command = "startinsert | 1";
    }
  ];
}
