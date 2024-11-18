{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    toggleterm-nvim
  ];
}
