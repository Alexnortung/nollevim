{ pkgs, ... }: {
  plugins.lsp = {
    enable = true;
    servers = {
      # clangd.enable = true;
      # efm = {
      #   enable = true;
      #   filetypes = [
      #     "typescript"
      #   ];
      # };
      rnix-lsp.enable = true;
      pyright.enable = true;
      rust-analyzer.enable = true;
      html.enable = true;
      cssls.enable = true;
      jsonls = {
        enable = true;
        extraOptions = {
          settings = {
            json = {
              schemas = { __raw = "require('schemastore').json.schemas()"; };
              validate = {
                enable = true;
              };
            };
          };
        };
      };
      eslint.enable = true;
      gdscript.enable = true;
      tsserver = {
        enable = true;
        extraOptions = {
          root_dir = { __raw = ''require("lspconfig.util").root_pattern("tsconfig.json")''; };
          single_file_support = false;
        };
      };
      denols = {
        enable = true;
        extraOptions = {
          root_dir = { __raw = ''require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")''; };
        };
      };
      # vuels.enable = true;
      volar.enable = true;
      # elixirls.enable = true;
      tailwindcss.enable = true;
      intelephense.enable = true;
    };
  };
  # plugins.lsp-lines = {
  #   enable = true;
  # };

  # plugins.efmls-configs = {
  #   enable = true;
  #
  #   setup = {
  #     typescript = {
  #       formatter = ["prettier"];
  #       linter = ["eslint"];
  #     };
  #   };
  # };

  extraPlugins = with pkgs.vimPlugins; [
    lsp_signature-nvim
    SchemaStore-nvim
  ];

  extraPackages = with pkgs; [
    nodePackages.typescript
    nodePackages.typescript-language-server
  ];
}
