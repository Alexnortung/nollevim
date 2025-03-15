{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.coding.extra.template-string-nvim;
in
{
  options.nollevim.coding.extra.template-string-nvim = {
    enable = lib.mkEnableOption "template-string-nvim";
  };

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [
      template-string-nvim
    ];
  };
}
