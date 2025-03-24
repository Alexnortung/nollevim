{ lib, config, ... }:

let
  cfg = config.nollevim.coding.extra.autopairs;
in
{
  options.nollevim.coding.extra.autopairs = {
    enable = lib.mkEnableOption "autopairs";
  };

  config = lib.mkIf cfg.enable {
    # plugins.mini = {
    #   enable = true;
    #
    #   modules = {
    #     pairs = {
    #       opts = {
    #         modes = { insert = true; command = true; terminal = false; };
    #         # skip autopair when next character is one of these
    #         skip_next = ''[=[[%w%%%'%[%"%.%`%$]]=]'';
    #         # skip autopair when the cursor is inside these treesitter nodes
    #         skip_ts = [ "string" ];
    #         # skip autopair when next character is closing pair
    #         # and there are more closing pairs than opening pairs
    #         skip_unbalanced = true;
    #         # better deal with markdown code blocks
    #         markdown = true;
    #       };
    #     };
    #   };
    # };

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
  };
}
