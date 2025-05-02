{ lib, config, ... }:
let
  cfg = config.nollevim.languages.typescript;
in
{
  imports = [
    ./typescript-tools.nix
  ];

  options.nollevim.languages.typescript = {
    enable = lib.mkEnableOption "Enable typescript programming language components for nollevim";
  };

  config = lib.mkIf cfg.enable {
    # Enable typescript language server
    # Add typescript-tools.nvim
    nollevim.languages.typescript = {
      typescript-tools.enable = lib.mkDefault true;
    };
  };
}
