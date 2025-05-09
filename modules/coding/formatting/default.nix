{
  lib,
  config,
  pkgs,
  ...
}:

let
  mkRaw = lib.nixvim.mkRaw;
  cfg = config.nollevim.coding.formatting;

  webFormatter = {
    __unkeyed-1 = "biome";
    __unkeyed-2 = "prettierd";
    __unkeyed-3 = "prettier";
    __unkeyed-4 = "biome_fallback";
    stop_after_first = true;
  };
  formatterWithoutBiome = {
    __unkeyed-1 = "prettierd";
    __unkeyed-2 = "prettier";
    __unkeyed-3 = "prettierd_fallback";
    stop_after_first = true;
  };
in
{
  options.nollevim.coding.formatting = {
    enable = lib.mkEnableOption "formatting";
  };

  config = lib.mkIf cfg.enable {
    extraPackages = with pkgs; [
      libxml2
      nixfmt-rfc-style
      prettierd
      nodePackages.prettier
    ];

    plugins.conform-nvim = {
      enable = true;

      settings = {
        notify_on_error = true;
        # default_format_opts = {
        #   lsp_format = "fallback";
        # };
        # format_after_save = {
        #   lsp_format = "fallback";
        # };
        format_on_save = ''
          function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end
            return { timeout_ms = 500, lsp_format = 'fallback' }
          end
        '';
        formatters_by_ft = {
          html = formatterWithoutBiome;
          xml = {
            __unkeyed-1 = "xmllint";
            stop_after_first = true;
          };
          css = webFormatter;
          json = webFormatter;
          yaml = formatterWithoutBiome;
          markdown = formatterWithoutBiome;
          javascript = webFormatter;
          javascriptreact = webFormatter;
          typescript = webFormatter;
          typescriptreact = webFormatter;
          java = [ "google-java-format" ];
          python = [ "black" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          rust = [ "rustfmt" ];
        };

        formatters =
          let
            prettierCond = mkRaw ''
              function(self, ctx)
                return vim.fs.find({ 
                  '.prettierrc', 
                  '.prettierrc.js', 
                  '.prettierrc.json', 
                  '.prettierrc.yml', 
                  '.prettierrc.yaml', 
                  'prettier.config.js' 
                }, { path = ctx.filename, upward = true })[1] ~= nil
              end
            '';
          in
          {
            prettier = {
              condition = prettierCond;
            };
            prettierd = {
              condition = prettierCond;
            };
            biome = {
              condition = mkRaw ''
                function(self, ctx)
                  return vim.fs.find({ 'biome.json' }, { path = ctx.filename, upward = true })[1] ~= nil
                end
              '';
            };
            biome_fallback = {
              command = "biome";
              args = [
                "format"
                "--fix"
                "--stdin-file-path"
                "$FILENAME"
              ];
            };
            prettierd_fallback = {
              command = "prettierd";
              args = [
                "--stdin-filepath"
                "$FILENAME"
              ];
            };
          };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>uf";
        action = ":FormatToggle<CR>";
        options = {
          desc = "Toggle Format Globally";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>uF";
        action = ":FormatToggle!<CR>";
        options = {
          desc = "Toggle Format Locally";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cf";
        action = "<cmd>lua require('conform').format()<cr>";
        options = {
          silent = true;
          desc = "Format Buffer";
        };
      }

      {
        mode = "v";
        key = "<leader>cF";
        action = "<cmd>lua require('conform').format()<cr>";
        options = {
          silent = true;
          desc = "Format Lines";
        };
      }
    ];

    userCommands = {
      DisableAutoformat = {
        command = "let g:disable_autoformat = 1";
      };
      EnableAutoformat = {
        command = "let g:disable_autoformat = 0";
      };
    };

    # extraConfigLuaPre = /*lua*/ ''
    #   function ConformGetCurrentFormatter()
    #     local conform = require("conform")
    #     local formatters = conform.list_formatters_for_buffer()
    #     if #formatters == 0 then
    #       print("No formatters available for this buffer")
    #     else
    #       for _, formatter in ipairs(formatters) do
    #         if formatter.available then
    #           print(string.format("Available formatter: %s%s",
    #             formatter.name,
    #             formatter.primary and " (primary)" or ""
    #           ))
    #         end
    #       end
    #     end
    #   end
    # '';
    #
    # userCommands = {
    #   ConformInfo
    # };
  };
}
