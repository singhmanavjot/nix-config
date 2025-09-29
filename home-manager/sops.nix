{ config, ... }:
{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    # Example secret configuration:
    # secrets = {
    #   "my_secret_key" = {
    #     path = "${config.home.homeDirectory}/.config/my_app/secret";
    #   };
    # };
  };
}
