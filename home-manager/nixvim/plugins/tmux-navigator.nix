{
  programs.nixvim.plugins.tmux-navigator = {
    enable = true;
    keymaps = [
      {
        action = "up";
        key = "<C-k>";
        mode = "n";
      }
      {
        action = "down";
        key = "<C-j>";
        mode = "n";
      }
      {
        action = "left";
        key = "<C-h>";
        mode = "n";
      }
      {
        action = "right";
        key = "<C-l>";
        mode = "n";
      }
    ];
  };
}
