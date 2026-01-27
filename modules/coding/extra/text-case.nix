{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.nollevim.coding.extra.text-case;
in
{
  options.nollevim.coding.extra.text-case = {
    enable = lib.mkEnableOption "Enable text-case.nvim";
  };

  config = lib.mkIf cfg.enable {
    extraPlugins = [
      pkgs.vimPlugins.text-case-nvim
    ];

    extraConfigLuaPost = # lua
      ''
        require('textcase').setup {}
        require('telescope').load_extension('textcase')
        vim.api.nvim_set_keymap('n', 'ga.', '<cmd>TextCaseOpenTelescope<CR>', { desc = "Telescope" })
        vim.api.nvim_set_keymap('v', 'ga.', "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
      '';

  };
}
