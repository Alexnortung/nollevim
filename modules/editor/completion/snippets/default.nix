{ lib, config, ... }:

let
  cfg = config.nollevim.editor.completion.snippets;
in
{
  imports = [
    ./friendly-snippets.nix
    ./luasnip.nix
  ];

  options.nollevim.editor.completion.snippets = {
    enable = lib.mkEnableOption "snippets";
  };

  config = lib.mkIf cfg.enable {
    nollevim.editor.completion.snippets = {
      luasnip.enable = lib.mkDefault true;
      friendly-snippets.enable = lib.mkDefault true;
    };
  };
}
