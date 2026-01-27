{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.nollevim.editor.movement.leap;
in
{
  options.nollevim.editor.movement.leap = {
    enable = lib.mkEnableOption "leap";
  };

  config = lib.mkIf cfg.enable {
    plugins.leap = {
      enable = true;
    };

    keymaps = [
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "s";
        action = "<Plug>(leap)";
      }
    ];
  };
}
