{ lib, config, ... }:

let
  cfg = config.nollevim.snacks;
in
{
  options.nollevim.snacks = {
    enable = lib.mkEnableOption "Enable snacks for nollevim";
  };

  config = lib.mkIf cfg.enable {
    plugins.snacks = {
      enable = true;
    };
  };
}
