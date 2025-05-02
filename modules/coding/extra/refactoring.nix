{ lib, config, ... }:

let
  cfg = config.nollevim.coding.extra.refactoring;
  mkRaw = lib.nixvim.mkRaw;
in
{
  options.nollevim.coding.extra.refactoring = {
    enable = lib.mkEnableOption "refactoring";
    enableKeymaps = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable refactoring keymaps";
    };
  };

  config = lib.mkIf cfg.enable {
    plugins.refactoring = {
      enable = true;
      enableTelescope = lib.mkDefault true;
    };

    # keymaps =
    #   let
    #     leader = "<leader>cc";
    #   in
    #   lib.mkIf cfg.enableKeymaps [
    #     {
    #       mode = [
    #         "n"
    #         "x"
    #       ];
    #       key = "${leader}c";
    #       # action = "<cmd>lua require('refactoring').select_refactor()<cr>";
    #       action = mkRaw ''
    #         require('refactoring').select_refactor()
    #       '';
    #     }
    #   ];
  };
}
