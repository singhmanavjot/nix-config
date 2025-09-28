{ pkgs, ... }:
{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources = {
      code_actions.statix.enable = true;
      formatting = {
        nixfmt = {
          enable = true;
          package = pkgs.nixfmt-rfc-style;
        };
        isort.enable = true;
        black.enable = true;
        markdownlint.enable = true;
        opentofu_fmt.enable = true;
        prettier.enable = true;
        prettierd.enable = true;
        shellharden.enable = true;
        shfmt.enable = true;
        stylua.enable = true;
        biome.enable = true;
      };

      diagnostics = {
        actionlint.enable = true;
        ansiblelint.enable = true;
        deadnix.enable = true;
        dotenv_linter.enable = true;
        hadolint.enable = true;
        markdownlint.enable = true;
        opentofu_validate.enable = true;
        statix.enable = true;
        tfsec.enable = true;
        trivy.enable = true;
        yamllint.enable = true;
        zsh.enable = true;
      };
    };
  };
}
