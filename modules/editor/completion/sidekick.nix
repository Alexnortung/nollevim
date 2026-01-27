{ lib, config, ... }:
let
  cfg = config.nollevim.editor.completion.sidekick;
in
{
  options.nollevim.editor.completion.sidekick = {
    enable = lib.mkEnableOption "Enable sidekick.nvim";
  };

  config = lib.mkIf cfg.enable {
    plugins.sidekick = {
      # enable = true;
    };
  };
}
