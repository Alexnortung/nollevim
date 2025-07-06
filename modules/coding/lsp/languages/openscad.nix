{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.nollevim.coding.lsp-nvim.languages.openscad;
in
{
  options.nollevim.coding.lsp-nvim.languages.openscad = {
    enable = lib.mkEnableOption "Enable OpenSCAD LSP support";
  };

  config = lib.mkIf cfg.enable {
    plugins.lsp.servers.openscad_ls = {
      # TODO: fix this
      # enable = lib.mkDefault true;
      # package = lib.mkDefault pkgs.openscad-lsp;
    };
  };
}
