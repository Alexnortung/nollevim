{ lib, config, ... }:
let
  cfg = config.nollevim.editor.completion.cmp;
  mkRaw = lib.nixvim.mkRaw;
in
{
  options.nollevim.editor.completion.cmp = {
    enable = lib.mkEnableOption "Enable completion cmp";
  };

  config =
    let
      luasnipEnabled = config.plugins.luasnip.enable;
      copilotEnabled = config.nollevim.editor.completion.copilot.enable;
    in
    lib.mkIf cfg.enable {
      plugins.lspkind = {
        enable = true;
      };
      plugins.cmp = {
        enable = true;

        settings = {
          sources =
            # lib.optional copilotEnabled { name = "copilot"; } ++
            [
              { name = "nvim_lsp"; }
            ]
            ++ (lib.optional luasnipEnabled { name = "luasnip"; })
            ++ [
              { name = "path"; }
              { name = "buffer"; }
            ];

          formatting = {
            fields = [
              "kind"
              "abbr"
              "menu"
            ];
          };
          performance = {
            debounce = 60;
            fetching_timeout = 200;
            max_view_entries = 30;
          };

          mapping =
            let
              mapping = {
                "<C-b>" =
                  # lua
                  mkRaw ''cmp.mapping.scroll_docs(-4)'';
                "<C-f>" =
                  # lua
                  mkRaw ''cmp.mapping.scroll_docs(4)'';
                "<C-Space>" =
                  # lua
                  mkRaw ''
                    -- cmp.mapping.complete({
                    --   config = {
                    --     sources = {
                    --       { name = "nvim_lsp" },
                    --       -- { name = "luasnip" },
                    --       { name = "path" },
                    --       { name = "buffer" },
                    --     }
                    --   }
                    -- })
                    cmp.mapping.complete()
                  '';
                "<C-e>" =
                  # lua
                  mkRaw "cmp.mapping.abort()";
                "<CR>" =
                  # lua
                  mkRaw "cmp.mapping.confirm({ select = true })";
                "<Tab>" =
                  # lua
                  mkRaw ''
                    function(fallback)
                      ${
                        if luasnipEnabled then
                          ''
                            local luasnip = require('luasnip')
                          ''
                        else
                          ""
                      }
                      ${
                        if luasnipEnabled then
                          ''
                            if luasnip.jumpable(1) then
                              luasnip.jump(1)
                          ''
                        else
                          ""
                      }
                      ${if luasnipEnabled then "else" else ""}if cmp.visible() then
                        cmp.select_next_item()
                      ${
                        if luasnipEnabled then
                          ''
                            elseif luasnip.expandable() then
                              luasnip.expand()
                            elseif luasnip.expand_or_jumpable() then
                              luasnip.expand_or_jump()
                          ''
                        else
                          ""
                      }
                      elseif check_backspace() then
                        fallback()
                      else
                        fallback()
                      end
                    end
                  '';
                "<S-Tab>" =
                  # lua
                  mkRaw ''
                    function(fallback)
                      if cmp.visible() then
                        cmp.select_prev_item()
                      ${
                        if luasnipEnabled then
                          ''
                            elseif luasnip.jumpable(-1) then
                              luasnip.jump(-1)
                          ''
                        else
                          ""
                      }
                      else
                        fallback()
                      end
                    end
                  '';
              };
            in
            mkRaw ''
              cmp.mapping.preset.insert(${lib.nixvim.toLuaObject mapping})
            '';
        };

        cmdline = {
          "/" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              {
                name = "buffer";
              }
            ];
          };
          ":" = {
            mapping = mkRaw "cmp.mapping.preset.cmdline()";
            sources = [
              {
                name = "path";
              }
              {
                name = "cmdline";
                option = {
                  ignore_cmds = [
                    "Man"
                    "!"
                  ];
                };
              }
            ];
          };
        };
      };

      extraConfigLuaPre = # lua
        ''
          mycmp = require'cmp'

          check_backspace = function()
              local col = vim.fn.col "." - 1
              return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
          end
        '';
    };
}
