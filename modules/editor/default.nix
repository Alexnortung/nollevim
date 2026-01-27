{ lib, config, ... }:

let
  cfg = config.nollevim.editor;
in
{
  imports = [
    ./appearance
    ./completion
    ./git
    ./movement
    ./session-restoration
    ./treesitter

    ./telescope.nix
    ./which-key.nix
  ];

  options.nollevim.editor = {
    enable = lib.mkEnableOption "editor";
  };

  config = lib.mkIf cfg.enable {
    nollevim.editor = {
      appearance.enable = lib.mkDefault true;
      completion.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      movement.enable = lib.mkDefault true;
      session-restoration.enable = lib.mkDefault true;
      telescope.enable = lib.mkDefault true;
      treesitter.enable = lib.mkDefault true;
      which-key.enable = lib.mkDefault true;
    };
  };
}
