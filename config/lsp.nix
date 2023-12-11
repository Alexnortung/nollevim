{ pkgs, ... }: {
  plugins.lsp = {
    enable = true;
    servers = {
      # clangd.enable = true;
      rnix-lsp.enable = true;
      pyright.enable = true;
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
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
      # eslint.enable = true;
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

  keymaps = [
    {
      mode = "n";
      key = "gD";
      action = "vim.lsp.buf.declaration";
      lua = true;
    }
    {
      mode = "n";
      key = "gd";
      action = "vim.lsp.buf.definition";
      lua = true;
    }
    {
      mode = "n";
      key = "K";
      action = "vim.lsp.buf.hover";
      lua = true;
    }
    {
      mode = "n";
      key = "gr";
      action = "vim.lsp.buf.references";
      lua = true;
    }
    {
      mode = "n";
      key = "gi";
      action = "vim.lsp.buf.implementation";
      lua = true;
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "vim.lsp.buf.signature_help";
      lua = true;
    }
    {
      mode = "n";
      key = "<leader>ck";
      action = "vim.diagnostic.open_float";
      lua = true;
    }
    {
      mode = "n";
      key = "<leader>ca";
      action = "vim.lsp.buf.code_action";
      lua = true;
    }
    {
      mode = "n";
      key = "<leader>cf";
      action = "vim.lsp.buf.format";
      lua = true;
    }
    {
      mode = "n";
      key = "<leader>rn";
      action = "vim.lsp.buf.rename";
      lua = true;
    }
  ];

  extraPlugins = with pkgs.vimPlugins; [
    lsp_signature-nvim
    SchemaStore-nvim
  ];

  extraPackages = with pkgs; [
    nodePackages.typescript
    nodePackages.typescript-language-server
  ];
}
