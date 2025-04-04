{ lib, config, ... }:

let
  cfg = config.nollevim.coding.extra.refactoring;
in
{
  options.nollevim.coding.extra.refactoring = {
    enable = lib.mkEnableOption "refactoring";
  };

  config = lib.mkIf cfg.enable {
    plugins.refactoring = {
      enable = true;
      enableTelescope = lib.mkDefault true;
    };
  };
}
