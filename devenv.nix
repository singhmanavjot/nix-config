{
  pkgs,
  ...
}:

{
  env.SOPS_AGE_KEY_FILE = "$HOME/.config/sops/age/keys.txt";

  packages = with pkgs; [
    nh
  ];

  languages.nix.enable = true;

  git-hooks.hooks = {
    actionlint.enable = true;
    deadnix = {
      enable = true;
      settings.edit = true;
    };
    nixfmt-rfc-style.enable = true;
    pre-commit-hook-ensure-sops.enable = true;
    prettier = {
      enable = true;
      fail_fast = true;
      verbose = true;
    };
    statix.enable = true;
    trim-trailing-whitespace.enable = true;
    end-of-file-fixer.enable = true;
    check-yaml.enable = true;
    check-added-large-files.enable = true;
    markdownlint.enable = true;
    zizmor.enable = true;
  };

  claude.code.enable = true;

  enterTest = ''
    nix flake check
    if [[ "$OSTYPE" == "darwin"* ]]; then
      nh darwin build -q --no-update-lock-file .
    else
      nh os build -q --no-update-lock-file .
    fi
  '';

}
