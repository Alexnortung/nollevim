{ lib, config, ... }:
let
  cfg = config.nollevim.editor.completion.copilot;
in
{
  options.nollevim.editor.completion.copilot = {
    enable = lib.mkEnableOption "Enable copilot";
  };

  config = lib.mkIf cfg.enable {
    plugins.copilot-lua = {
      enable = true;
      settings = {
        panel = {
          enabled = lib.mkDefault false;
          autoRefresh = lib.mkDefault true;
          keymap = {
            jumpPrev = lib.mkDefault "[[";
            jumpNext = lib.mkDefault "]]";
            accept = lib.mkDefault "<CR>";
            refresh = lib.mkDefault "gr";
            open = lib.mkDefault "<M-CR>";
          };
          layout = {
            position = lib.mkDefault "bottom"; # | top | left | right
            ratio = lib.mkDefault 0.4;
          };
        };
        suggestion = {
          enabled = lib.mkDefault false;
          autoTrigger = lib.mkDefault true;
          debounce = lib.mkDefault 75;
          keymap = {
            accept = lib.mkDefault "<M-l>";
            acceptWord = lib.mkDefault false;
            acceptLine = lib.mkDefault false;
            next = lib.mkDefault "<M-]>";
            prev = lib.mkDefault "<M-[>";
            dismiss = lib.mkDefault "<C-]>";
          };
        };
        filetypes = {
          yaml = lib.mkDefault false;
          markdown = lib.mkDefault false;
          help = lib.mkDefault false;
          gitcommit = lib.mkDefault false;
          gitrebase = lib.mkDefault false;
          hgcommit = lib.mkDefault false;
          svn = lib.mkDefault false;
          cvs = lib.mkDefault false;
          "." = lib.mkDefault false;
        };
        copilotNodeCommand = lib.mkDefault "node"; # Node.js version must be > 18.x
        serverOptsOverrides = { };

      };
    };
  };
}
