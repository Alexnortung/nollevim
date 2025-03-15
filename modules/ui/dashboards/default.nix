{ lib, config, ... }:

let
  cfg = config.nollevim.ui.dashboards;
in
{
  imports = [
    ./snacks.nix
  ];

  options.nollevim.ui.dashboards = {
    enable = lib.mkEnableOption "Enable dashboards";
  };

  config = lib.mkIf cfg.enable {
    nollevim.ui.dashboards.snacks.enable = lib.mkDefault true;
  };
}
