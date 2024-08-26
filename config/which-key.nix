{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    which-key-nvim
  ];

  # extraConfigLuaPost = ''
  #   local wk = require("which-key")
  #   wk.setup {
  #   }
  #
  #   wk.register {
  #       ["<leader>"] = {
  #           f = {
  #               name = "+file",
  #           },
  #           h = {
  #               name = "+git",
  #           },
  #           c = {
  #               name = "+code";
  #           },
  #       },
  #   }
  # '';
}
