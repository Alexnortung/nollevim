{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    nvim-rename-state
  ];

  extraConfigLuaPost = /*lua*/ ''
    require('lsp_signature').setup({
        select_signature_key = '<M-n>',
    });
  '';
}
