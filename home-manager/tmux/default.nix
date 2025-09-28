{
  pkgs,
  lib,
  ...
}:
{
  programs = {
    tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      historyLimit = 10000;
      mouse = true;
      baseIndex = 1;
      keyMode = "vi";
      disableConfirmationPrompt = true;
      escapeTime = 0;
      tmuxinator.enable = true;
      extraConfig = lib.strings.fileContents ./tmux.conf;
      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavour 'mocha'
            set -g @catppuccin_status_background "none"
            set -g @catppuccin_window_status_style "none"
            set -g @catppuccin_pane_status_enabled "off"
            set -g @catppuccin_pane_border_status "off"
          '';
        }
        tmuxPlugins.vim-tmux-navigator
        # tmuxPlugins.tmux-which-key
      ];
    };
    sesh.enable = true;
    fzf.tmux.enableShellIntegration = true;
  };
  home.file = {
    ".config/tmuxinator/dotfiles.yml".source = ./tmuxinator/dotfiles.yml;
    ".config/tmuxinator/homelab.yml".source = ./tmuxinator/homelab.yml;
  };
}
