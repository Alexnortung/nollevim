{ lib, config, ... }:

let
  cfg = config.nollevim.editor.completion;
in
{
  imports = [
    ./cmp.nix
    ./copilot.nix
    ./snippets
  ];

  options.nollevim.editor.completion = {
    enable = lib.mkEnableOption "completion";
  };

  config = lib.mkIf cfg.enable {
    nollevim.editor.completion = {
      cmp.enable = lib.mkDefault true;
      copilot.enable = lib.mkDefault true;
      snippets.enable = lib.mkDefault true;
    };
  };
}
