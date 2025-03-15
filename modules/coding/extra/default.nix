{ lib, config, ... }:

let
  cfg = config.nollevim.coding.extra;
in
{
  imports = [
    ./autopairs.nix
    ./editorconfig.nix
    ./template-string-nvim.nix
    ./ts-comments.nix
  ];

  options.nollevim.coding.extra = {
    enable = lib.mkEnableOption "Enable coding extras";
  };

  config = lib.mkIf cfg.enable {
    nollevim.coding.extra = {
      autopairs.enable = lib.mkDefault true;
      editorconfig.enable = lib.mkDefault true;
      template-string-nvim.enable = lib.mkDefault true;
      ts-comments.enable = lib.mkDefault true;
    };
  };
}
