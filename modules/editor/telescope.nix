{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.editor.telescope;
in
{
  options.nollevim.editor.telescope = {
    enable = lib.mkEnableOption "Enable telescope.nvim";
    enableKeymaps = lib.mkOption {
      type = with lib.types; bool;
      default = true;
      description = ''
        Enable keymaps for telescope
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    plugins.telescope = {
      enable = true;

    };

    keymaps = lib.mkIf cfg.enableKeymaps [
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options = {
          desc = "Find files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>p";
        action = "<cmd>Telescope find_files<cr>";
        options = {
          desc = "Find files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fl";
        action = "<cmd>Telescope live_grep<cr>";
        options = {
          desc = "Live grep files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<cmd>Telescope resume<cr>";
        options = {
          desc = "Resume last telescope session";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
        options = {
          desc = "Find buffers";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fp";
        action = "<cmd>Telescope projects<cr>";
        options = {
          desc = "Find projects";
          silent = true;
        };
      }
    ];
  };
}
