{ config, lib, pkgs, ... }:
with lib.hm.gvariant;
{
  dconf.settings = {
    #"org/gnome/desktop/background" = {
    #  picture-uri = "file:///home/martin/.local/share/backgrounds/2023-02-09-20-47-36-DeterminateColorway-2560x1440.png";
    #};

    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };

    "org/gnome/desktop/interface" = {
      clock-format = "24h";
      color-scheme = "prefer-dark";
      cursor-size = 32;
      document-font-name = "Work Sans 12";
      font-name = "Work Sans 12";
      gtk-enable-primary-paste = true;
      monospace-font-name = "FiraCode Nerd Font Medium 13";
      text-scaling-factor = 1.0;
    };

    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 7200;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-left = [ "<Primary><Alt>Left" ];
      switch-to-workspace-right = [ "<Primary><Alt>Right" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
      audible-bell = false;
      titlebar-font = "Work Sans Semi-Bold 12";
    };

    "org/gnome/GWeather" = {
      temperature-unit = "centigrade";
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ "<Super>Left" ];
      toggle-tiled-right = [ "<Super>Right" ];
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-timeout = 0;
      sleep-inactive-ac-type = "nothing";
    };

    "org/gtk/gtk4/Settings/FileChooser" = {
      clock-format = "24h";
    };

    "org/gtk/Settings/FileChooser" = {
      clock-format = "24h";
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      size = 32;
    };

    font = {
      name = "Work Sans 12";
      package = pkgs.work-sans;
    };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };

    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };

  home.pointerCursor = {
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };
}
