{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.nollevim.coding.languages.openscad;
in
{
  options.nollevim.coding.languages.openscad = {
    enable = lib.mkEnableOption "Enable OpenSCAD language support";
  };

  config = lib.mkIf cfg.enable {
    # Enable OpenSCAD lsp
    nollevim.coding.lsp-nvim.languages.openscad.enable = lib.mkDefault true;
  };
}
