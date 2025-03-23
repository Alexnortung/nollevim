{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.coding.extra.template-string-nvim;
in
{
  options.nollevim.coding.extra.template-string-nvim = {
    enable = lib.mkEnableOption "template-string-nvim";
  };

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [
      template-string-nvim
    ];

    extraConfigLua = /*lua*/ ''
      require('template-string').setup({
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }, -- filetypes where the plugin is active
        jsx_brackets = true, -- must add brackets to jsx attributes
        remove_template_string = true, -- remove backticks when there are no template string
        restore_quotes = {
          -- quotes used when "remove_template_string" option is enabled
          normal = [[']],
          jsx = [["]],
        },
      })
    '';
  };
}
