{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    copilot-lua
  ];
  extraConfigLua = ''
    require('copilot').setup({
      suggestion = {
        auto_trigger = true,
      },
    })
  '';
}
