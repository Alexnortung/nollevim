{ lib, config, ... }:

let
  cfg = config.nollevim.coding.languages;
in
{
  imports = [
    ./openscad
  ];

  options.nollevim.coding.languages = {
    enable = lib.mkEnableOption "Enable all languages by default";
  };

  config = lib.mkIf cfg.enable {
    nollevim.coding.languages = {
      openscad.enable = lib.mkDefault true;
    };
  };
}
