{ lib, config, ... }:

let
  cfg = config.nollevim.ui.dashboards.snacks;
in
{
  options.nollevim.ui.dashboards.snacks = {
    enable = lib.mkEnableOption "Enable Snacks dashboard";
  };

  config = lib.mkIf cfg.enable {
    nollevim.snacks.enable = true;

    plugins.snacks.settings.dashboard = {
      enabled = true;
      preset = {
        header = "Welcome to nollevim";
      };
      sections = [{ section = "header"; }];
    };

  };
}
