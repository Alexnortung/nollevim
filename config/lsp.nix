{
  plugins.lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      rnix-lsp.enable = true;
      pyright.enable = true;
      rust-analyzer.enable = true;
      html.enable = true;
      cssls.enable = true;
      jsonls.enable = true;
      eslint.enable = true;
      gdscript.enable = true;
      tsserver.enable = true;
      # denols.enable = true;
      vuels.enable = true;
      elixirls.enable = true;
    };
  };
  plugins.lsp-lines = {
    enable = true;
  };
}
