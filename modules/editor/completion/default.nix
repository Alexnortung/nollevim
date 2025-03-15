{ lib, config, ... }:

let
  cfg = config.nollevim.editor.completion;
in
{
  imports = [
    ./cmp.nix
    ./snippets
  ];

  options.nollevim.editor.completion = {
    enable = lib.mkEnableOption "completion";
  };

  config = lib.mkIf cfg.enable {
    nollevim.editor.completion = {
      cmp.enable = lib.mkDefault true;
      snippets.enable = lib.mkDefault true;
    };
  };
}
