{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.editor.leap;
in
{
  options.nollevim.editor.leap = {
    enable = lib.mkEnableOption "leap";
  };

  config = lib.mkIf cfg.enable {
    plugins.leap = {
      enable = true;
      addDefaultMappings = true;
    };
  };
}
