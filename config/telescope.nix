{pkgs, ...}: {
  plugins.telescope = {
    enable = true;
    defaults = {
      # path_display = "smart";
      winblend = 5;
      borderchars = [" " " " " " " " " " " " " " " "];
      border = [];
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

  extraPackages = with pkgs; [
    ripgrep
  ];
}
