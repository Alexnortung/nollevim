{
  plugins.nvim-tree = {
    enable = true;

    disableNetrw = true;
    hijackNetrw = true;

    git = {
      enable = true;
      ignore = true;
      timeout = 500;
    };

    view = {
      side = "right";
      mappings = {
        customOnly = false;
        list = [
          {
            key = ["l" "<CR>" "o"];
            action = ''require("nvim-tree.config").nvim_tree_callback "edit"'';
          }
          {
            key = "h";
            action = ''require("nvim-tree.config").nvim_tree_callback "close_node"'';
          }
          {
            key = "v";
            action = ''require("nvim-tree.config").nvim_tree_callback "vsplit"'';
          }
          # { key = "v", cb = require("nvim-tree.config").nvim_tree_callback "vsplit" },
        ];
      };
    };

    trash = {
      cmd = "trash";
      # requireConfirm = true;
    };

    diagnostics = {
      enable = true;
    };
  };
}
