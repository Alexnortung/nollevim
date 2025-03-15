{ lib, config, ... }:

let
  cfg = config.nollevim.editor.completion.snippets.luasnip;
in
{
  options.nollevim.editor.completion.snippets.luasnip = {
    enable = lib.mkEnableOption "luasnip";
  };

  config = lib.mkIf cfg.enable {
    plugins.luasnip = {
      enable = true;
      fromVscode = [
        { }
      ];
    };
  };
}
