{
  keymaps = [
    # Better windom navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
    }
    # Make sure leader does not do it's default action
    {
      mode = "n";
      key = "<Space>";
      action = "<Nop>";
    }
    # Move between buffers easily
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
    # Close buffer
    {
      mode = "n";
      key = "<A-w>";
      action = ":Bdelete!<CR>";
    }
    # Indent, stay in visual mode
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }
    # Move text under cursor up and down
    # visual."<A-j>" = ":m .+1<CR>==gv";
    # visual."<A-k>" = ":m .-2<CR>==gv";
    # Move text under cursor up and down
    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<CR>gv=gv";
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<CR>gv=gv";
    }
    # When pasting in visual mode, do not yank the replaces text
    # visual."p" = "\"_dP";
    {
      mode = "v";
      key = "p";
      action = "\"_c Ph\"_x";
    }
  ];
}
