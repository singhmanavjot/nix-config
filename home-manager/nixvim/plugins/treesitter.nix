{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
      };
      folding = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
    treesitter-textobjects.enable = true;
    treesitter-context = {
      enable = true;

      settings = {
        enable = false;
        max_lines = 1;
        trim_scope = "inner";
      };
    };
    rainbow-delimiters.enable = true;
  };
}
