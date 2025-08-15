{ lib, config, ... }:

let
  cfg = config.nollevim.editor.completion.snippets.alex-snippets;
in
{
  options.nollevim.editor.completion.snippets.alex-snippets = {
    enable = lib.mkEnableOption "Alexnortung's nollevim snippets";
  };

  config = lib.mkIf cfg.enable {
    plugins.luasnip = {
      enable = true;

      fromVscode = [
        {
          lazyLoad = true;
        }
        {
          lazyLoad = true;
          paths = [
            ../../../../snippets
          ];
        }
      ];
    };
  };
}
