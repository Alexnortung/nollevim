{ lib, config, ... }:

let
  cfg = config.nollevim.coding.extra.ts-comments;
in
{
  options.nollevim.coding.extra.ts-comments = {
    enable = lib.mkEnableOption "ts-comments";
  };

  config = lib.mkIf cfg.enable {
    plugins.ts-comments = {
      enable = true;
    };
  };
}
