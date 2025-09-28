{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    plugins = {
      inherit (pkgs.yaziPlugins) lazygit;
      inherit (pkgs.yaziPlugins) starship;
      inherit (pkgs.yaziPlugins) piper;
    };
    settings = {
      plugin.prepend_previewers = [
        {
          name = "*.md";
          run = "piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark \"$1\"";
        }
      ];
    };
    initLua = ''
      require("starship"):setup()
    '';
    keymap = {
      mgr.prepend_keymap = [
        {
          run = "shell \"$SHELL\" --block";
          on = [ "!" ];
          for = "unix";
          desc = "Open $SHELL here";
        }
        {
          run = "plugin lazygit";
          on = [
            "g"
            "i"
          ];
          desc = "run lazygit";
        }
      ];
    };
    theme = {
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "yazi";
        rev = "0c274adb1e128bbc3355363703759a0842be620c";
        sha256 = "sha256-nEF3gs8JAipZK8Ut67EVHw6zW1zCeFse4b2LxOwRIlc=";
      };
      file = "themes/mocha/catppuccin-mocha-blue.toml";
    };
  };
}
