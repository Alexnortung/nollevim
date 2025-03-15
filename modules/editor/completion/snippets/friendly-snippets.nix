{ lib, config, ... }:

let
  cfg = config.nollevim.editor.completion.snippets.friendly-snippets;
in
{
  options.nollevim.editor.completion.snippets.friendly-snippets = {
    enable = lib.mkEnableOption "friendly-snippets";
  };

  config = lib.mkIf cfg.enable {
    plugins.friendly-snippets = {
      enable = true;
    };
  };
}
