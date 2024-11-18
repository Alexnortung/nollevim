{ lib, ... }: {
  plugins.lspkind = {
    enable = true;
    mode = "symbol";
    extraOptions = { };
  };
  plugins.nvim-cmp = {
    enable = true;
    # preselect = "None";
    snippet.expand = "luasnip";
    mappingPresets = [ "insert" "cmdline" ];
    mapping = {
      "<C-b>" = ''cmp.mapping.scroll_docs(-4)'';
      "<C-f>" = ''cmp.mapping.scroll_docs(4)'';
      "<C-Space>" = /*lua*/ ''
        cmp.mapping.complete({
          config = {
            sources = {
              { name = "nvim_lsp" },
              { name = "luasnip" },
              { name = "path" },
              { name = "buffer" },
            }
          }
        })
      '';
      "<C-e>" = /*lua*/ "cmp.mapping.abort()";
      "<CR>" = /*lua*/ "cmp.mapping.confirm({ select = true })";
      "<Tab>" = {
        modes = [ "i" "s" ];
        action = /*lua*/ ''
          function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            elseif cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end
        '';
      };
      "<S-Tab>" = {
        modes = [ "i" "s" ];
        action = /*lua*/ ''
          function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end
        '';
      };
    };

    formatting = {
      fields = [
        "kind"
        "abbr"
        "menu"
      ];

      format = lib.mkForce /*lua*/ ''
        function (entry, vim_item)
          local kind = require('lspkind').cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50,
            before = function (entry, vim_item)
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
              })[entry.source.name]
              return vim_item
            end
          })(entry, vim_item)

          kind.kind = string.format(" %s ", kind.kind)
          return kind
        end
      '';

      #format = /*lua*/ ''

      #    require('lspkind').cmp_format({
      #      mode = 'symbol', -- show only symbol annotations
      #      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      #                     -- can also be a function to dynamically calculate max width such as 
      #                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      #      ellipsis_char = '..', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      #      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      #      -- The function below will be called before any actual modifications from lspkind
      #      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      #      before = function (entry, vim_item)
      #        -- ...
      #        return vim_item
      #      end
      #    })
      #  --   function(entry, vim_item)
      #  --     -- Kind icons
      #  --     vim_item.kind = string.format(" %s ", kind_icons[vim_item.kind])
      #  --     -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      #  --     vim_item.menu = ({
      #  --       nvim_lsp = "[LSP]",
      #  --       luasnip = "[Snippet]",
      #  --       buffer = "[Buffer]",
      #  --       path = "[Path]",
      #  --     })[entry.source.name]
      #  --     return vim_item
      #  -- end
      #'';
    };

    # window = {
    #   # completion = {
    #   #   side_padding = 0;
    #   # };
    # };

    sources = [
      # { name = "copilot"; }
      { name = "luasnip"; } #-- For luasnip users.
      { name = "nvim_lsp"; }
      { name = "path"; }
      { name = "buffer"; }
    ];

    # confirm_opts = {
    #   behavior = "Replace";
    #   select = false;
    # };
  };

  extraConfigLuaPre = /*lua*/ ''
    mycmp = require'cmp'
    cmp_autopairs = require('nvim-autopairs.completion.cmp')

    check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    --   פּ ﯟ   some other good icons
    -- kind_icons = {
    --   Text = "",
    --   Method = "m",
    --   Function = "",
    --   Constructor = "",
    --   Field = "",
    --   Variable = "",
    --   Class = "",
    --   Interface = "",
    --   Module = "",
    --   Property = "",
    --   Unit = "",
    --   Value = "",
    --   Enum = "",
    --   Keyword = "",
    --   Snippet = "",
    --   Color = "",
    --   File = "",
    --   Reference = "",
    --   Folder = "",
    --   EnumMember = "",
    --   Constant = "",
    --   Struct = "",
    --   Event = "",
    --   Operator = "",
    --   TypeParameter = "",
    -- }
  '';

  extraConfigLuaPost = /*lua*/ ''
    mycmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
    )
  '';
}
