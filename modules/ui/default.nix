{ lib, config, ... }:
let
  cfg = config.nollevim.ui;
in
{
  imports = [
    ./bufferlines
    ./dashboards
    ./filetrees
  ];

  options.nollevim.ui = {
    enable = lib.mkEnableOption "Enable UI components for nollevim";
  };

  config = lib.mkIf cfg.enable {
    nollevim.ui = {
      bufferlines.enable = lib.mkDefault true;
      dashboards.enable = lib.mkDefault true;
      filetrees.enable = lib.mkDefault true;
    };
  };
}
