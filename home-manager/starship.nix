{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      palette = "catppuccin_mocha";
      docker_context = {
        # disabled = true;
        only_with_files = true;
      };
      time = {
        disabled = false;
      };
      kubernetes = {
        disabled = false;
        symbol = "󱃾 ";
        contexts = [
          {
            context_pattern = "gke_.*_(?P<var_cluster>[\\w-]+)";
            context_alias = "gke-$var_cluster";
          }
        ];
      };
      gcloud = {
        # symbol = "️  ";
        format = "on[$symbol$project]($style) ";
        disabled = true;
      };
      git_status = {
        ahead = "⇡\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        behind = "⇣\${count}";
      };
    }
    // builtins.fromTOML (
      builtins.readFile (
        pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "starship";
          rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
          sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
        }
        + /palettes/mocha.toml
      )
    );
  };
}
