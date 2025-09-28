{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };

    keymaps = {
      "<leader>?" = {
        action = "oldfiles";
        mode = "n";
        options.desc = "Find recently opened files";
      };

      "<leader>sb" = {
        action = "buffers";
        mode = "n";
        options.desc = "Search open buffers";
      };

      "<leader>sf" = {
        action = "find_files";
        mode = "n";
        options.desc = "Find files (including hidden)";
      };

      "<leader>sh" = {
        action = "help_tags";
        mode = "n";
        options.desc = "Search help tags";
      };

      "<leader>sg" = {
        action = "live_grep";
        mode = "n";
        options.desc = "Live grep search";
      };

      "<leader>sc" = {
        action = "git_bcommits";
        mode = "n";
        options.desc = "[S]earch buffer [C]ommits";
      };

      "<leader>/" = {
        action = "current_buffer_fuzzy_find";
        mode = "n";
        options.desc = "Fuzzily search in current buffer";
      };

      "<leader>ss" = {
        action = "spell_suggest";
        mode = "n";
        options.desc = "Spell suggestions search";
      };

      gr = {
        action = "lsp_references";
        mode = "n";
        options.desc = "LSP: Go to references";
      };

      gi = {
        action = "lsp_implementations";
        mode = "n";
        options.desc = "LSP: Go to implementations";
      };

      "<leader>bs" = {
        action = "lsp_document_symbols";
        mode = "n";
        options.desc = "LSP: Document symbols";
      };

      "<leader>ps" = {
        action = "lsp_workspace_symbols";
        mode = "n";
        options.desc = "LSP: Workspace symbols";
      };
    };
  };
}
