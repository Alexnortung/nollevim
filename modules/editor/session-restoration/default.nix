{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.editor.session-restoration;
in
{
  imports = [
    ./auto-session.nix
    ./persistence.nix
  ];

  options.nollevim.editor.session-restoration = {
    enable = lib.mkEnableOption "Enable session restoration";
  };

  config = lib.mkIf cfg.enable {
    nollevim.editor.session-restoration = {
      auto-session.enable = lib.mkDefault true;
      persistence.enable = lib.mkDefault false;
    };
  };
}
