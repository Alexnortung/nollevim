{
  plugins.nvim-autopairs = {
    enable = true;
  };

  extraConfigLuaPre = ''
    npairs = require('nvim-autopairs')
  '';

  extraConfigLuaPost = ''
    npairs.setup {
        check_ts = true,
    }
  '';
}
