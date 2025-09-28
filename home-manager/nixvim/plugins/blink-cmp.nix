{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      wordnet
      fzf
      git
      gh
      glab
      curl
    ];

    plugins = {
      blink-cmp-dictionary.enable = true;
      blink-cmp-git.enable = true;
      blink-emoji.enable = true;
      blink-ripgrep.enable = true;
      lsp-signature.enable = true;
      luasnip = {
        enable = true;
        settings.update_events = "TextChanged,TextChangedI";
      };
      blink-cmp = {
        enable = true;

        settings = {
          keymap.preset = "super-tab";
          signature.enabled = true;

          sources = {
            default = [
              "buffer"
              "lsp"
              "path"
              "snippets"
              "dictionary"
              "emoji"
              "git"
              "ripgrep"
            ];

            providers = {
              ripgrep = {
                name = "Ripgrep";
                module = "blink-ripgrep";
                score_offset = 1;
              };
              dictionary = {
                name = "Dict";
                module = "blink-cmp-dictionary";
                min_keyword_length = 3;
              };
              emoji = {
                name = "Emoji";
                module = "blink-emoji";
                score_offset = 1;
              };
              lsp.score_offset = 4;
              git = {
                name = "Git";
                module = "blink-cmp-git";
                enabled = true;
                score_offset = 100;
                should_show_items.__raw = ''
                  function()
                    return vim.o.filetype == 'gitcommit' or vim.o.filetype == 'markdown'
                  end
                '';
                opts = {
                  git_centers = {
                    github = {
                      issue = {
                        on_error.__raw = "function(_,_) return true end";
                      };
                    };
                  };
                };
              };
            };
          };

          completion = {
            menu.draw = {
              gap = 1;
              treesitter = [ "lsp" ];
              columns = [
                {
                  __unkeyed-1 = "label";
                }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
                { __unkeyed-1 = "source_name"; }
              ];
            };
            trigger.show_in_snippet = false;
            documentation = {
              auto_show = true;
              window.border = "single";
            };
            accept.auto_brackets.enabled = false;
          };
        };
      };
    };
  };
}
