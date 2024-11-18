{ pkgs, ... }:

{
  # enable Neve bufferline
  bufferline.enable = true;
  bufferline.keymaps = {
    enableHL = false;
  };

  keymaps = [
    {
      mode = "n";
      key = "<A-w>";
      action = ":Bdelete %<CR>";
    }
    {
      mode = "n";
      key = "<A-l>";
      action = ":bnext<CR>";
    }
    {
      mode = "n";
      key = "<A-h>";
      action = ":bprevious<CR>";
    }
  ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-bbye
  ];
}
