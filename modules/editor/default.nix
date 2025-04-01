{ lib, config, ... }:

let
  cfg = config.nollevim.editor;
in
{
  imports = [
    ./appearance
    ./completion
    ./git
    ./session-restoration
    ./treesitter

    ./leap.nix
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
      leap.enable = lib.mkDefault true;
      session-restoration.enable = lib.mkDefault true;
      telescope.enable = lib.mkDefault true;
      treesitter.enable = lib.mkDefault true;
      which-key.enable = lib.mkDefault true;
    };
  };
}
