{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.nollevim.editor.movement.spider;
in
{
  options.nollevim.editor.movement.spider = {
    enable = lib.mkEnableOption "spider";
  };

  config = lib.mkIf cfg.enable {
    plugins.spider = {
      enable = true;

    };

    keymaps = [
      {
        mode = [
          "n"
          "o"
          "x"
        ];

        key = "w";
        action = "<cmd>lua require('spider').motion('w')<CR>";
        options = {
          silent = true;
          desc = "Spider-w: Move to the beginning of the next word";
        };
      }
      {
        mode = [
          "n"
          "o"
          "x"
        ];

        key = "e";
        action = "<cmd>lua require('spider').motion('e')<CR>";
        options = {
          silent = true;
          desc = "Spider-e: Move to the end of the next word";
        };
      }
      {
        mode = [
          "n"
          "o"
          "x"
        ];

        key = "b";
        action = "<cmd>lua require('spider').motion('b')<CR>";
        options = {
          silent = true;
          desc = "Spider-b: Move to the beginning of the previous word";
        };
      }
    ];
  };
}
