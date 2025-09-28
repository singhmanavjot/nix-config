{
  programs.nixvim.plugins.cloak = {
    enable = true;

    settings.patterns = [
      {
        cloak_pattern = "=.+";
        file_pattern = "**/*.env*";
      }
    ];
  };
}
