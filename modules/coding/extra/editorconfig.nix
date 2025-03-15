{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.coding.extra.editorconfig;
in
{
  options.nollevim.coding.extra.editorconfig = {
    enable = lib.mkEnableOption "editorconfig";
  };

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [
      editorconfig-nvim
    ];
  };
}
