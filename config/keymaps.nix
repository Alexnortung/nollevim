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
    # # Make sure leader does not do it's default action
    # {
    #   mode = "n";
    #   key = "<Space>";
    #   action = "<Nop>";
    # }
    # Move between buffers easily
    # {
    #   mode = "n";
    #   key = "<A-l>";
    #   action = ":bnext<CR>";
    # }
    # {
    #   mode = "n";
    #   key = "<A-h>";
    #   action = ":bprevious<CR>";
    # }
    # Close buffer
    # {
    #   mode = "n";
    #   key = "<A-w>";
    #   action = ":Bdelete!<CR>";
    # }
    {
      mode = "n";
      key = "Y";
      action = "6j";
    }
    {
      mode = "n";
      key = "U";
      action = "6k";
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
  ];
}
