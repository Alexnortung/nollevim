{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.editor.session-restoration.persistence;
in
{
  options.nollevim.editor.session-restoration.persistence = {
    enable = lib.mkEnableOption "Enable persistence";
  };

  config = lib.mkIf cfg.enable {
    plugins.persistence = {
      enable = true;
    };
  };
}
