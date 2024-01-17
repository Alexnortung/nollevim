{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    editorconfig-nvim
    vim-sleuth # detects indentation
    gitsigns-nvim
    which-key-nvim
    vim-bbye
    template-string-nvim
    nvim-rename-state
  ];

  extraConfigLua = /*lua*/ ''
    require('template-string').setup({
      filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }, -- filetypes where the plugin is active
      jsx_brackets = true, -- must add brackets to jsx attributes
      remove_template_string = false, -- remove backticks when there are no template string
      restore_quotes = {
        -- quotes used when "remove_template_string" option is enabled
        normal = [[']],
        jsx = [["]],
      },
    })
  '';

  extraConfigLuaPost = /*lua*/ ''
    require('lsp_signature').setup({
        select_signature_key = '<M-n>',
    });
  '';
}
