{ username, ... }:
{
  system = {
    primaryUser = username;
    defaults = {
      NSGlobalDomain = {
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        AppleShowScrollBars = "Automatic";
        AppleTemperatureUnit = "Celsius";
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 15;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        _HIHideMenuBar = false;
        AppleFontSmoothing = 1;
        AppleInterfaceStyle = "Dark";
        "com.apple.sound.beep.volume" = 0.606531; # 50%
        "com.apple.mouse.tapBehavior" = 1;
        AppleKeyboardUIMode = 3;
        ApplePressAndHoldEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSWindowResizeTime = 0.001;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
        "com.apple.swipescrolldirection" = false; # "natural" scrolling
      };

      CustomUserPreferences = {
        "com.apple.finder".FXDefaultSearchScope = "SCcf";
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.Adlib".allowApplePersonaliziedAdvertising = false;
        "com.apple.print.PrintingPrefs"."Quit When Finished" = true;
        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          ScheduleFrequency = 1;
          AutomaticDownload = 1;
          CriticalUpdateInstall = 1;
        };
        "com.apple.commerce".AutoUpdate = true;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.2;
        expose-animation-duration = 0.2;
        tilesize = 32;
        launchanim = false;
        showhidden = true;
        show-recents = false;
        expose-group-apps = false;
        mru-spaces = false;
        # Disable all hot corners
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };

      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };

      spaces.spans-displays = false;

      trackpad = {
        Clicking = true;
        Dragging = true;
        TrackpadRightClick = true;
      };

      finder = {
        FXEnableExtensionChangeWarning = true;
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
        QuitMenuItem = true;
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      WindowManager.StandardHideDesktopIcons = true;
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
