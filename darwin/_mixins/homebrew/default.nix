{
  inputs,
  username,
  platform,
  config,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = if (platform == "aarch64-darwin") then true else false;
    user = "${username}";
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;

    taps = builtins.attrNames config.nix-homebrew.taps;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    global.brewfile = true;

    masApps = {
      "Infuse" = 1136220934;
    };

    casks = [
      "1password"
      "obsidian"
      "signal"
      "zen"
      "discord"
      "flameshot"
      "grammarly-desktop"
      "tidal"
      "stats"
      "yaak"
    ];

    brews = [
    ];

  };
}
