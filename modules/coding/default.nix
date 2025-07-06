{ lib, config, ... }:
let
  cfg = config.nollevim.coding;
in
{
  imports = [
    ./commenting
    ./extra
    ./formatting
    ./languages
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
      languages.enable = lib.mkDefault true;
      linting.enable = lib.mkDefault true;
      lsp-nvim.enable = lib.mkDefault true;
      lsp-nvim-file-operations.enable = lib.mkDefault true;
    };
  };
}
