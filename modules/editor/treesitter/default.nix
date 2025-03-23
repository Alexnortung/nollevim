{ lib, config, ... }:

let
  cfg = config.nollevim.editor.treesitter;
in
{
  options.nollevim.editor.treesitter = {
    enable = lib.mkEnableOption "Enable treesitter";
  };

  config = lib.mkIf cfg.enable {
    plugins.treesitter = {
      enable = true;
      nixGrammars = true;
      settings = {
        highlight = {
          enable = lib.mkDefault true;
        };
        indent = {
          enable = lib.mkDefault true;
        };
      };
    };

    # TODO: Move this?
    plugins.ts-autotag = {
      enable = lib.mkDefault true;
    };
  };
}
