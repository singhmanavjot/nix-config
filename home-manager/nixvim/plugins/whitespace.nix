{
  programs.nixvim.plugins.whitespace = {
    enable = true;

    settings = {
      ignore_terminal = true;
      ignored_filetypes = [
        "TelescopePrompt"
        "Trouble"
      ];
    };
  };
}
