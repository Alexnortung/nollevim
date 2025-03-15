{ pkgs, lib, config, ... }:
let
  cfg = config.nollevim.coding.lsp-nvim;
  mkDefault = lib.mkDefault;
  mkIf = lib.mkIf;
in
{
  options.nollevim.coding.lsp-nvim = {
    enable = lib.mkEnableOption "lsp-nvim";
    keymaps = {
      enable = lib.mkEnableKeymaps "lsp-nvim";
    };
  };
  config = mkIf cfg.enable {
    plugins = {
      lsp = {
        enable = mkDefault true;
        capabilities = mkDefault "offsetEncoding = 'utf-16'";
        servers = {
          clangd = {
            enable = mkDefault true;
          };
          lua_ls = {
            enable = mkDefault true;
            extraOptions = {
              settings = mkDefault {
                Lua = {
                  completion = {
                    callSnippet = "Replace";
                  };
                  diagnostics = {
                    globals = [ "vim" ];
                  };
                  hint = {
                    enable = true;
                  };
                };
              };
            };
          };
          nixd = {
            enable = mkDefault true;
          };
          ts_ls = {
            enable = mkDefault true;
            autostart = mkDefault true;
            filetypes = mkDefault [
              "javascript"
              "javascriptreact"
              "typescript"
              "typescriptreact"
            ];
            extraOptions = {
              settings = mkDefault {
                javascript = {
                  inlayHints = {
                    includeInlayEnumMemberValueHints = true;
                    includeInlayFunctionLikeReturnTypeHints = true;
                    includeInlayFunctionParameterTypeHints = true;
                    includeInlayParameterNameHints = "all";
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                    includeInlayPropertyDeclarationTypeHints = true;
                    includeInlayVariableTypeHints = true;
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true;
                  };
                };
                typescript = {
                  inlayHints = {
                    includeInlayEnumMemberValueHints = true;
                    includeInlayFunctionLikeReturnTypeHints = true;
                    includeInlayFunctionParameterTypeHints = true;
                    includeInlayParameterNameHints = "all";
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                    includeInlayPropertyDeclarationTypeHints = true;
                    includeInlayVariableTypeHints = true;
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true;
                  };
                };
              };
            };
          };
          jsonls = {
            enable = mkDefault true;
            # extraOptions = {
            #   settings = {
            #     json = {
            #       schemas = { __raw = "require('schemastore').json.schemas()"; };
            #       validate = {
            #         enable = true;
            #       };
            #     };
            #   };
            # };
          };
          yamlls = {
            enable = mkDefault true;
          };
          # eslint = {
          #   enable = mkDefault true;
          # };
          biome = {
            enable = mkDefault true;
          };
          pyright = {
            enable = mkDefault true;
          };
          ruff = {
            enable = mkDefault true;
          };

          rust_analyzer = {
            enable = mkDefault true;
            installCargo = mkDefault true;
            installRustc = mkDefault true;
            settings = {
              checkOnSave = mkDefault true;
              check = {
                command = mkDefault "clippy";
              };
              procMacro = {
                enable = mkDefault true;
              };
            };
          };
        };
        keymaps = mkIf cfg.keymaps.enable {
          silent = mkDefault true;
          lspBuf = {
            gd = mkDefault {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = mkDefault {
              action = "references";
              desc = "Goto References";
            };
            gD = mkDefault {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = mkDefault {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = mkDefault {
              action = "type_definition";
              desc = "Type Definition";
            };
            K = mkDefault {
              action = "hover";
              desc = "Hover";
            };
            "<leader>cw" = mkDefault {
              action = "workspace_symbol";
              desc = "Workspace Symbol";
            };
            "<leader>cr" = mkDefault {
              action = "rename";
              desc = "Rename";
            };
            "<leader>ca" = mkDefault {
              action = "code_action";
              desc = "Code Action";
            };
            "<C-k>" = mkDefault {
              action = "signature_help";
              desc = "Signature Help";
            };
          };
          diagnostic = {
            "<leader>cd" = mkDefault {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "[d" = mkDefault {
              action = "goto_next";
              desc = "Next Diagnostic";
            };
            "]d" = mkDefault {
              action = "goto_prev";
              desc = "Previous Diagnostic";
            };
          };
        };
        # onAttach = ''
        #   vim.api.nvim_create_autocmd("LspAttach", {
        #     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        #     callback = function(args)
        #       local client = vim.lsp.get_client_by_id(args.data.client_id)
        #       if client.server_capabilities.inlayHintProvider then
        #         vim.lsp.inlay_hint.enable(false)
        #       end
        #       vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        #     end,
        #   })
        # '';
      };
    };
    # extraConfigLua = ''
    #   local _border = "rounded"
    #
    #   require('lspconfig.ui.windows').default_options = {
    #     border = _border
    #   }
    #
    #   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    #     vim.lsp.handlers.hover, {
    #       border = _border
    #     }
    #   )
    #
    #   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    #     vim.lsp.handlers.signature_help, {
    #       border = _border
    #     }
    #   )
    #
    #   vim.diagnostic.config({
    #     float = { border = "rounded" },
    #     virtual_text = {
    #       prefix = "",
    #     },
    #     signs = true,
    #     underline = true,
    #     update_in_insert = true,
    #   })
    # '';

    plugins.schemastore = {
      enable = true;
      json = {
        enable = true;
      };
      yaml = {
        enable = true;
      };
    };
  };
}
