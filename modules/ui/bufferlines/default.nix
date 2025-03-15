{ lib, config, ... }:
let
  cfg = config.nollevim.ui.bufferlines;
in
{
  imports = [
    ./bufferline.nix
  ];

  options.nollevim.ui.bufferlines = {
    enable = lib.mkEnableOption "Enable nollevim default bufferline";
  };

  config = lib.mkIf cfg.enable {
    nollevim.ui.bufferlines.bufferline.enable = lib.mkDefault true;
  };
}
