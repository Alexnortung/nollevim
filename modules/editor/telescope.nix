{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.editor.telescope;
in
{
  options.nollevim.editor.telescope = {
    enable = lib.mkEnableOption "Enable telescope.nvim";
  };

  config = lib.mkIf cfg.enable {
    plugins.telescope = {
      enable = true;

    };
  };
}
