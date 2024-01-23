{ pkgs
, lib
, config
, ...
}:
let
  js = {
    formatter = [ "eslint_d" ];
    linter = "eslint_d";
  };
  langueageSetup = {
    javascript = js;
    javascriptreact = js;
    "javascript.jsx" = js;
    typescript = js;
    typescriptreact = js;
    "typescript.tsx" = js;
  };
  filetypes = lib.attrNames langueageSetup;
in
{
  plugins.lsp.servers.efm = {
    enable = true;
    filetypes = filetypes;
    extraOptions = {
      init_options = {
        documentFormatting = true;
        documentRangeFormatting = true;
      };
      # settings = {
      #   languages = { __raw = ''require('efmls-configs.defaults').languages()''; };
      # };
    };
  };
  plugins.efmls-configs = {
    enable = true;
    setup = langueageSetup;
  };

  plugins.lsp-format = {
    enable = true;
  };
}
