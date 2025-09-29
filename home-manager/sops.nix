{ config, ... }:
{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = {
      "test_secret" = {
        path = "${config.home.homeDirectory}/.config/test_secret";
      };
      "home_test_file_content" = {
        path = "${config.home.homeDirectory}/.local/share/test_secret_file.txt";
      };
    };
  };
}
