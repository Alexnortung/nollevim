{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.editor.session-restoration.auto-session;
in
{
  options.nollevim.editor.session-restoration.auto-session = {
    enable = lib.mkEnableOption "Enable auto-session";
  };

  config = lib.mkIf cfg.enable {
    plugins.auto-session = {
      enable = true;
    };
  };
}
