{
  programs.aerospace = {
    enable = true;
    launchd.enable = true;
    settings = {
      accordion-padding = 30;
      after-login-command = [ ];
      after-startup-command = [
        "exec-and-forget open -a Ghostty"
        # "exec-and-forget /etc/profiles/per-user/${username}/bin/zsh -c sketchybar"
      ];
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      exec-on-workspace-change = [
        # "/etc/profiles/per-user/${username}/bin/zsh"
        # "-c"
        # "sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE"
      ];
      key-mapping.preset = "qwerty";
      on-focus-changed = [ ];
      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
      on-window-detected = [
        {
          check-further-callbacks = false;
          "if".app-id = "app.zen-browser.zen";
          run = "move-node-to-workspace 2";
        }
        {
          check-further-callbacks = false;
          "if".app-id = "com.tidal.desktop";
          run = "move-node-to-workspace D";
        }
        {
          check-further-callbacks = false;
          "if".app-id = "md.obsidian";
          run = "move-node-to-workspace 3";
        }
      ];
      start-at-login = true;
      workspace-to-monitor-force-assignment = {
        "1" = "main";
        "2" = "main";
        "3" = "main";
        "4" = "main";
        "5" = "main";
        "6" = "main";
        "7" = "main";
        "8" = "main";
        "9" = "main";
        "A" = "built-in";
        "S" = "built-in";
        "D" = "built-in";
      };
      automatically-unhide-macos-hidden-apps = false;
      gaps = {
        inner = {
          horizontal = 12;
          vertical = 12;
        };
        outer = {
          left = 12;
          bottom = 12;
          top = [
            { monitor."MPG321UX OLED" = 12; }
            12
          ];
          right = 12;
        };
      };
      mode.main.binding = {
        # See: https://nikitabobko.github.io/AeroSpace/commands#layout
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        # See: https://nikitabobko.github.io/AeroSpace/commands#focus
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        # See: https://nikitabobko.github.io/AeroSpace/commands#move
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        # See: https://nikitabobko.github.io/AeroSpace/commands#resize
        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";

        # See: https://nikitabobko.github.io/AeroSpace/commands#workspace
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-a = "workspace A";
        alt-s = "workspace S";
        alt-d = "workspace D";

        # See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace
        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-shift-a = "move-node-to-workspace A";
        alt-shift-s = "move-node-to-workspace S";
        alt-shift-d = "move-node-to-workspace D";

        # See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth
        alt-tab = "workspace-back-and-forth";
        # See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

        # See: https://nikitabobko.github.io/AeroSpace/commands#mode
        alt-shift-semicolon = "mode service";
      };
      mode.service.binding = {
        esc = [
          "reload-config"
          "mode main"
        ];
        r = [
          "flatten-workspace-tree"
          "mode main"
        ]; # reset layout
        f = [
          "layout floating tiling"
          "mode main"
        ];
        backspace = [
          "close-all-windows-but-current"
          "mode main"
        ];

        alt-shift-h = [
          "join-with left"
          "mode main"
        ];
        alt-shift-j = [
          "join-with down"
          "mode main"
        ];
        alt-shift-k = [
          "join-with up"
          "mode main"
        ];
        alt-shift-l = [
          "join-with right"
          "mode main"
        ];
      };
    };
  };
}
