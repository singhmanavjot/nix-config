{
  programs.nixvim.plugins.lualine = {
    enable = true;

    lazyLoad.settings.event = "BufEnter";

    settings = {
      options = {
        theme = "catppuccin";
        globalstatus = true;
        section_separators = {
          left = "█";
          right = "█";
        };
      };
    };
  };
}
