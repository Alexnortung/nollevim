{ lib, config, pkgs, ... }:

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
    # TODO: move to neo-tree file
    plugins.neo-tree = {
      enable = true;
      enableDiagnostics = lib.mkDefault true;
      enableGitStatus = lib.mkDefault true;
      enableModifiedMarkers = lib.mkDefault true;
      enableRefreshOnWrite = lib.mkDefault true;
      closeIfLastWindow = lib.mkDefault true;
      popupBorderStyle = lib.mkDefault "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
      buffers = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
      };
      window = {
        width = 40;
        height = 15;
        autoExpandWidth = false;
        mappings = {
          "<space>" = "none";
          "l" = "open";
          "h" = "close_node";
          # "<leader>p"

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
