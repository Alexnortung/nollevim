{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.nollevim.ui.filetrees;
in
{
  options.nollevim.ui.filetrees = {
    enable = lib.mkEnableOption "filetrees";
    enableKeymaps = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable keymaps for filetrees";
    };
  };

  config = lib.mkIf cfg.enable {
    plugins.neo-tree = {
      enable = true;
      settings = {
        enable_diagnostics = lib.mkDefault true;
        enable_git_status = lib.mkDefault true;
        enable_modified_markers = lib.mkDefault true;
        enable_refresh_on_write = lib.mkDefault true;
        close_if_last_window = lib.mkDefault true;
        popup_border_style = lib.mkDefault "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code

        buffers = {
          bind_to_cwd = false;
          follow_current_file = {
            enabled = true;
          };
        };

        window = {
          width = 40;
          height = 15;
          # autoExpandWidth = false;
          auto_expand_height = false;
          mappings = {
            "<space>" = "none";
            "l" = "open";
            "h" = "close_node";
            # "<leader>p"

          };
        };
      };
    };

    keymaps = lib.mkIf cfg.enableKeymaps [
      {
        mode = "n";
        key = "<leader>fe";
        action = "<cmd>Neotree toggle position=right<CR>";
        options = {
          desc = "Toggle Neotree";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fn";
        action = "<cmd>Neotree reveal position=right<CR>";
        options = {
          desc = "Show Neotree and reveal current file";
          silent = true;
        };
      }
    ];

    # autoCmd = lib.mkIf config.plugins.persistence.enable [
    #   {
    #     event = "PersistenceSavePre";
    #     command = ":Neotree close";
    #   }
    # ];

    # extraConfigLuaPost = /*lua*/ ''
    #   vim.api.nvim_create_autocmd("PersistenceSavePre", {
    #     command = "Neotree close",
    #   })
    # '';
  };
}
