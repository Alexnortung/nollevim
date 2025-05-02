{ lib, config, ... }:
let
  cfg = config.nollevim.languages;
in
{
  imports = [
    ./typescript
  ];

  options.nollevim.languages = {
    enable = lib.mkEnableOption "Enable programming language components for nollevim";
  };

  config = lib.mkIf cfg.enable {
    nollevim.languages = {
      typescript.enable = lib.mkDefault true;
    };
  };
}
