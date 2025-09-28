{
  programs.nixvim.plugins.mini = {
    enable = true;

    mockDevIcons = true;

    modules = {
      ai = { };
      bracketed = { };
      cursorword = { };
      icons = { };
      operators = { };
    };
  };
}
