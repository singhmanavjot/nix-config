{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github_auth_key";
      };
      "homelab" = {
        hostname = "192.168.13.200";
        user = "manav";
        identityFile = "~/.ssh/homelab";
      };
    };
  };
}
