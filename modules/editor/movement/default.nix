{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.nollevim.editor.movement;
in
{
  imports = [
    ./leap.nix
    ./spider.nix
  ];

  options.nollevim.editor.movement = {
    enable = lib.mkEnableOption "Enable default movement settings";
  };

  config = lib.mkIf cfg.enable {
    nollevim.editor.movement = {
      leap.enable = lib.mkDefault true;
      spider.enable = lib.mkDefault false;
    };
  };
}
