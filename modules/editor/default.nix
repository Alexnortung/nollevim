{ lib, config, ... }:

let
  cfg = config.nollevim.editor;
in
{
  imports = [
    ./completion
    ./git

    ./leap.nix
    ./telescope.nix
    ./which-key.nix
  ];

  options.nollevim.editor = {
    enable = lib.mkEnableOption "editor";
  };

  config = lib.mkIf cfg.enable {
    nollevim.editor = {
      completion.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      leap.enable = lib.mkDefault true;
      telescope.enable = lib.mkDefault true;
      which-key.enable = lib.mkDefault true;
    };
  };
}
