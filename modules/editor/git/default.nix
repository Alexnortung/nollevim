{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.editor.git;
in
{
  options.nollevim.editor.git = {
    enable = lib.mkEnableOption "Enable git integration";
    enableKeymaps = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable default keymaps for git integration";
    };
  };

  config = lib.mkIf cfg.enable {
    # TODO: move to a separate module
    plugins.gitsigns = {
      enable = true;
    };
    # plugins.which-key.settings.spec = [
    #   {
    #     __unkeyed-1 = "<leader>"
    #   }
    # ];
    keymaps = lib.mkIf cfg.enableKeymaps [
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>gh";
        action = "gitsigns";
        options = {
          silent = true;
          desc = "+hunks";
        };
      }
      {
        mode = "n";
        key = "<leader>ghb";
        action = ":Gitsigns blame_line<CR>";
        options = {
          silent = true;
          desc = "Blame line";
        };
      }
      {
        mode = "n";
        key = "<leader>ghB";
        action = ":Gitsigns blame<CR>";
        options = {
          silent = true;
          desc = "Blame buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>ghd";
        action = ":Gitsigns diffthis<CR>";
        options = {
          silent = true;
          desc = "Diff This";
        };
      }
      {
        mode = "n";
        key = "<leader>ghp";
        action = ":Gitsigns preview_hunk<CR>";
        options = {
          silent = true;
          desc = "Preview hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>ghR";
        action = ":Gitsigns reset_buffer<CR>";
        options = {
          silent = true;
          desc = "Reset Buffer";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>ghr";
        action = ":Gitsigns reset_hunk<CR>";
        options = {
          silent = true;
          desc = "Reset Hunk";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>ghs";
        action = ":Gitsigns stage_hunk<CR>";
        options = {
          silent = true;
          desc = "Stage Hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>ghS";
        action = ":Gitsigns stage_buffer<CR>";
        options = {
          silent = true;
          desc = "Stage Buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>ghu";
        action = ":Gitsigns undo_stage_hunk<CR>";
        options = {
          silent = true;
          desc = "Undo Stage Hunk";
        };
      }
    ];
  };
}
