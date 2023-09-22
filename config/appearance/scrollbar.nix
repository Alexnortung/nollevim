{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    nvim-scrollbar
  ];

  extraConfigLua = ''
    require("scrollbar").setup({
        show = true,
    })
  '';
}
