{ lib, config, ... }:

let
  cfg = config.nollevim.coding.extra.surround;
in
{
  options.nollevim.coding.extra.surround = {
    enable = lib.mkEnableOption "surround";
  };
  config = lib.mkIf cfg.enable {
    plugins.surround = {
      enable = true;
    };
  };
}
