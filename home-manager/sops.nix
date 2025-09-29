{ config, ... }:
{
  # Configure sops-nix for encrypted secret management
  # This module sets up SOPS (Secrets OPerationS) with age encryption
  # for securely managing secrets in the Nix configuration
  sops = {
    # Default secrets file containing encrypted secrets
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    # Path to the age private key used for decrypting secrets
    # The key should be placed at ~/.config/sops/age/keys.txt
    # Generate a new key with: age-keygen -o ~/.config/sops/age/keys.txt
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };
}
