{
  lib,
  config,
  ...
}:

let
  cfg = config.nollevim.editor.appearance.render-markdown;
in
{
  options.nollevim.editor.appearance.render-markdown = {
    enable = lib.mkEnableOption "render-markdown";
  };

  config = lib.mkIf cfg.enable {
    plugins.render-markdown = {
      enable = true;
    };
  };
}
