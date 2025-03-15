{ lib, config, ... }:
let
  cfg = config.nollevim.coding;
in
{
  imports = [
    ./commenting
    ./extra
    ./formatting
    ./linting
    ./lsp
  ];

  options.nollevim.coding = {
    enable = lib.mkEnableOption "Enable nollevim default coding tools";
  };

  config = lib.mkIf cfg.enable {
    nollevim.coding = {
      commenting.enable = lib.mkDefault true;
      extra.enable = lib.mkDefault true;
      formatting.enable = lib.mkDefault true;
      linting.enable = lib.mkDefault true;
      lsp-nvim.enable = lib.mkDefault true;
    };
  };
}
