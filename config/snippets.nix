{pkgs, ...}: {
  plugins.luasnip = {
    enable = true;

    fromVscode = [
      {
        lazyLoad = true;
      }
      {
        lazyLoad = true;
        paths = [
          ../snippets
        ];
      }
    ];
  };

  extraPlugins = with pkgs.vimPlugins; [
    friendly-snippets
  ];

  extraConfigLuaPre = ''
    luasnip = require'luasnip'
  '';
}
