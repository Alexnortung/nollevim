{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.coding.commenting;
in
{
  options.nollevim.coding.commenting = {
    enable = lib.mkEnableOption "Enable commenting";
  };

  config = lib.mkIf cfg.enable {
    plugins.ts-context-commentstring = {
      enable = true;
      disableAutoInitialization = false;
    };
  };
}

