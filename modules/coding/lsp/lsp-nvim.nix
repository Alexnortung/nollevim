{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.nollevim.coding.lsp-nvim;
  mkDefault = lib.mkDefault;
  mkIf = lib.mkIf;
in
{
  options.nollevim.coding.lsp-nvim = {
    enable = lib.mkEnableOption "lsp-nvim";
    keymaps = {
      # enable = lib.mkEnableKeymaps "lsp-nvim";
      enable = lib.mkOption {
        default = true;
        description = ''
          Enable keymaps for LSP.
        '';
      };
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
          dockerls = {
            enable = mkDefault true;
          };
          nixd = {
            enable = mkDefault true;
          };
          ts_ls = {
            enable = mkDefault false;
            autostart = mkDefault true;
            filetypes = mkDefault [
              "javascript"
              "javascriptreact"
              "javascript.jsx"
              "typescript"
              "typescriptreact"
              "typescript.tsx"
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

          vtsls = {
            enable = mkDefault true;
            autostart = mkDefault true;
            filetypes = mkDefault [
              "javascript"
              "javascriptreact"
              "javascript.jsx"
              "typescript"
              "typescriptreact"
              "typescript.tsx"
            ];

            extraOptions = {
              settings = mkDefault {

                vtsls = {
                  enableMoveToFileCodeAction = true;
                  autoUseWorkspaceTsdk = true;
                };
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

          svelte = {
            enable = mkDefault true;
          };

          # turbo_ls = {
          #   enable = true;
          # };
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
          postgres_lsp = {
            enable = mkDefault true;
          };
          ruff = {
            enable = mkDefault true;
          };
          openscad_ls = {
            enable = mkDefault true;
            package = pkgs.openscad-lsp;
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

          phpactor = {
            enable = false;
          };

          intelephense = {
            enable = true;
            package = pkgs.unstable.intelephense;
            extraOptions = {

              settings = {
                intelephense = {
                  environment = {
                    includePaths = [ "vendor/php-stubs/wordpress-stubs" ];
                  };
                  files = {
                    maxSize = 3200000;
                  };

                  stubs =
                    let
                      defaultStubs = [
                        "apache"
                        "bcmath"
                        "bz2"
                        "calendar"
                        "com_dotnet"
                        "Core"
                        "ctype"
                        "curl"
                        "date"
                        "dba"
                        "dom"
                        "enchant"
                        "exif"
                        "FFI"
                        "fileinfo"
                        "filter"
                        "fpm"
                        "ftp"
                        "gd"
                        "gettext"
                        "gmp"
                        "hash"
                        "iconv"
                        "imap"
                        "intl"
                        "json"
                        "ldap"
                        "libxml"
                        "mbstring"
                        "meta"
                        "mysqli"
                        "oci8"
                        "odbc"
                        "openssl"
                        "pcntl"
                        "pcre"
                        "PDO"
                        "pdo_ibm"
                        "pdo_mysql"
                        "pdo_pgsql"
                        "pdo_sqlite"
                        "pgsql"
                        "Phar"
                        "posix"
                        "pspell"
                        "readline"
                        "Reflection"
                        "session"
                        "shmop"
                        "SimpleXML"
                        "snmp"
                        "soap"
                        "sockets"
                        "sodium"
                        "SPL"
                        "sqlite3"
                        "standard"
                        "superglobals"
                        "sysvmsg"
                        "sysvsem"
                        "sysvshm"
                        "tidy"
                        "tokenizer"
                        "xml"
                        "xmlreader"
                        "xmlrpc"
                        "xmlwriter"
                        "xsl"
                        "Zend OPcache"
                        "zip"
                        "zlib"

                      ];
                    in
                    defaultStubs
                    ++ [
                      "Core"
                      "wordpress"
                    ];
                };
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
            # "<C-k>" = mkDefault {
            #   action = "signature_help";
            #   desc = "Signature Help";
            # };
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
