{
  pkgs,
  lib,
  hostname,
  username,
  platform,
  ...
}:
let
  ansible-ls = pkgs.stdenv.mkDerivation rec {
    pname = "ansible-language-server";
    version = "1.2.3";

    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/@ansible/ansible-language-server/-/ansible-language-server-${version}.tgz";
      hash = "sha256-MYKWCjXyKfRT1SDPtsliTKGBBGU0V+ypncFAZpD6WqI=";
    };

    nativeBuildInputs = [ pkgs.makeWrapper ];

    unpackPhase = ''
      tar xzf $src
    '';

    installPhase = ''
      mkdir -p $out/lib/node_modules/@ansible/ansible-language-server
      cp -r package/* $out/lib/node_modules/@ansible/ansible-language-server/

      mkdir -p $out/bin
      makeWrapper ${pkgs.nodejs}/bin/node $out/bin/ansible-language-server \
        --add-flags "$out/lib/node_modules/@ansible/ansible-language-server/out/server.js"
    '';

    meta = with pkgs.lib; {
      description = "Ansible Language Server";
      homepage = "https://www.npmjs.com/package/@ansible/ansible-language-server";
      license = licenses.mit;
      platforms = platforms.all;
    };
  };
in
{
  programs.nixvim.plugins = {
    fidget = {
      enable = true;
      settings.notification.window.winblend = 0;
    };
    lsp-format.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd = {
          enable = true;
          settings = {
            #nixpkgs.expr = ''import "${nixpkgs.outPath}" { }'';
            formatting.command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            options =
              let
                flake = ''(builtins.getFlake "github:singhmanavjot/nix-config")'';
              in
              {
                nix-darwin.expr = ''${flake}.darwinConfigurations.${hostname}.options'';
                home-manager.expr = ''${flake}.homeConfigurations."${username}@${hostname}".options'';
                nixvim.expr = ''${flake}.packages.${platform}.default.options'';
              };
          };
        };
        ansiblels = {
          enable = true;
          package = ansible-ls;
        };
        bashls.enable = true;
        docker_compose_language_service.enable = true;
        dockerls.enable = true;
        eslint.enable = true;
        gitlab_ci_ls.enable = true;
        helm_ls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        markdown_oxide.enable = true;
        marksman = {
          enable = true;
          filetypes = [
            "markdown"
          ];
        };
        postgres_lsp.enable = true;
        ruff.enable = true;
        statix.enable = true;
        sqls.enable = true;
        tailwindcss = {
          enable = true;
          filetypes = [
            "typescriptreact"
            "javascriptreact"
            "html"
            "svelte"
          ];
        };
        terraformls.enable = true;
        vimls.enable = true;
        yamlls.enable = true;
        biome.enable = true;
        cssls.enable = true;
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gD = {
            action = "declaration";
            desc = "LSP: Go to declaration";
          };
        };
      };
    };
  };
}
