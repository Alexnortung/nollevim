{ lib, config, ... }:

let
  cfg = config.nollevim;
in
{
  imports = [
    ./coding
    ./editor
    ./keymaps
    ./ui
    ./util

    ./options.nix
  ];

  options.nollevim = {
    # enable = lib.mkEnableOption "Enable nollevim defaults";
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable nollevim defaults";
    };
  };

  config = lib.mkIf cfg.enable {
    nollevim = {
      coding.enable = lib.mkDefault true;
      editor.enable = lib.mkDefault true;
      ui.enable = lib.mkDefault true;
      options.enable = lib.mkDefault true;
    };
  };
}
