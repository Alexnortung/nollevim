{ pkgs, ... }: {
  plugins.telescope = {
    enable = true;
    defaults = {
      # path_display = "smart";
      winblend = 5;
      borderchars = [ " " " " " " " " " " " " " " " " ];
      border = [ ];
      prompt_prefix = " 🤓 ";
      entry_prefix = "   ";
      selection_caret = "🤌 ";
      layout_config = {
        horizontal = {
          prompt_position = "top";
          results_width = 0.5;
          preview_width = 0.5;
        };
      };
    };
    extensions = {
      # project-nvim = {
      #   enable = true;
      # };
      #   media_files = {
      #     enable = true;
      #     find_cmd = "rg";
      #     # find_cmd = "${pkgs.ripgrep}/bin/rg";
      #   };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>p";
      action = "<cmd>Telescope find_files<cr>";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
    }
    {
      mode = "n";
      key = "<leader>fl";
      action = "<cmd>Telescope live_grep<cr>";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>Telescope resume<cr>";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
    }
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>Telescope projects<cr>";
    }
  ];

  extraPackages = with pkgs; [
    ripgrep
  ];
}
