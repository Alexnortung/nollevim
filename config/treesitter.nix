{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    nixGrammars = true;
    indent = true;
    ensureInstalled = "all";
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvim-ts-rainbow # treesitter color brackets
    nvim-ts-autotag
    nvim-ts-context-commentstring
  ];

  extraConfigLuaPost = ''
    --require('nvim-treesitter.configs').setup {
    --    ['ensure_installed'] = 'all',
    --    ['highlight'] = {
    --        ['enable'] = true
    --    },
    --    ['indent'] = {
    --        ['enable'] = true
    --    },
    --    context_commentstring = {
    --        enable = true,
    --        enable_autocmd = false,
    --    },
    --    rainbow = {
    --        enable = true,
    --        extended_mode = true,
    --    },
    --    -- autotag = {
    --    --     enable = true,
    --    -- },
    --}

    require('nvim-ts-autotag').setup()
  '';
}
