{ lib, config, ... }:
let
  cfg = config.nollevim.languages.typescript.typescript-tools;
in
{
  options.nollevim.languages.typescript.typescript-tools = {
    enable = lib.mkEnableOption "Enable typescript-tools.nvim";
  };

  config = lib.mkIf cfg.enable {
    plugins.typescript-tools = {
      # enable = lib.mkDefault true;
    };
  };
}
