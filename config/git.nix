{
  plugins.gitsigns.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>hs";
      action = "<cmd>Gitsigns stage_hunk<CR>";
    }
    {
      mode = "v";
      key = "<leader>hs";
      action = "<cmd>Gitsigns stage_hunk<CR>";
    }
    {
      mode = "n";
      key = "<leader>hr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
    }
    {
      mode = "v";
      key = "<leader>hr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
    }
    {
      mode = "n";
      key = "<leader>hb";
      action = "<cmd>Gitsigns blame_line<CR>";
    }
    {
      mode = "n";
      key = "<leader>hd";
      action = "<cmd>Gitsigns diffthis<CR>";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action = "<cmd>Gitsigns preview_hunk<CR>";
    }
    {
      mode = "n";
      key = "<leader>hn";
      action = "<cmd>Gitsigns next_hunk<CR>";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action = "<cmd>Gitsigns prev_hunk<CR>";
    }
  ];
}
