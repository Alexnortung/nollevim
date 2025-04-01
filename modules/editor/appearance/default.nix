{ lib, config, ... }:

let
  cfg = config.nollevim.editor.appearance;
in
{
  imports = [
    ./render-markdown.nix
  ];

  options.nollevim.editor.appearance = {
    enable = lib.mkEnableOption "appearance";
  };

  config = lib.mkIf cfg.enable {
    nollevim.editor.appearance = {
      render-markdown.enable = lib.mkDefault true;
    };
  };
}
