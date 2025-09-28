{
  programs.nixvim.plugins.nvim-ufo = {
    enable = true;

    settings.provider_selector.__raw = ''
      function(_bufnr, _filetype, _buftype)
        return { "treesitter", "indent" }
      end
    '';
  };
}
