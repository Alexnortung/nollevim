{
  maps = {
    # Better windom navigation
    normal."<C-h>" = "<C-w>h";
    normal."<C-j>" = "<C-w>j";
    normal."<C-k>" = "<C-w>k";
    normal."<C-l>" = "<C-w>l";

    # Make sure leader does not do it's default action
    normal."<Space>" = "<Nop>";

    # Move between buffers easily
    normal."<A-l>" = ":bnext<CR>";
    normal."<A-h>" = ":bprevious<CR>";
    # Close buffer
    normal."<A-w>" = ":Bdelete!<CR>";

    # Indent, stay in visual mode
    visual."<" = "<gv";
    visual.">" = ">gv";

    # Move text under cursor up and down
    visual."<A-j>" = ":m .+1<CR>==gv";
    visual."<A-k>" = ":m .-2<CR>==gv";

    # When pasting in visual mode, do not yank the replaces text
    visual."p" = "\"_dP";

    # Nvim tree
    normal."<leader>nn" = ":NvimTreeToggle<CR>";
    normal."<leader>nf" = ":NvimTreeFindFile<CR>";
    normal."<leader>nr" = ":NvimTreeRefresh<CR>";

    # LSP stuff
    normal."gD" = "<cmd>lua vim.lsp.buf.declaration()<CR>";
    normal."gd" = "<cmd>lua vim.lsp.buf.definition()<CR>";
    normal."K" = "<cmd>lua vim.lsp.buf.hover()<CR>";
    normal."gi" = "<cmd>lua vim.lsp.buf.implementation()<CR>";
    # normal."<C-k>" = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
    normal."gr" = "<cmd>lua vim.lsp.buf.references()<CR>";
    normal."<leader>ck" = "<cmd>lua vim.diagnostic.open_float()<CR>";
    normal."<leader>ca" = "<cmd>lua vim.lsp.buf.code_action()<CR>";
    normal."<leader>cf" = "<cmd>lua vim.lsp.buf.format({ timeout_ms = 3500 })<CR>";

    # Telescope
    normal."<leader>p" = "<cmd>Telescope find_files<CR>";
    normal."<leader>ff" = "<cmd>Telescope find_files<CR>";
    normal."<leader>fl" = "<cmd>Telescope live_grep<CR>";
    normal."<leader>fr" = "<cmd>Telescope resume<CR>";
    normal."<leader>fp" = "<cmd>Telescope projects<CR>";

    # Gitsigns
    normal."<leader>hs" = "<cmd>Gitsigns stage_hunk<CR>";
    visual."<leader>hs" = "<cmd>Gitsigns stage_hunk<CR>";
    normal."<leader>hr" = "<cmd>Gitsigns reset_hunk<CR>";
    visual."<leader>hr" = "<cmd>Gitsigns reset_hunk<CR>";
    normal."<leader>hb" = "<cmd>Gitsigns blame_line<CR>";
    normal."<leader>hd" = "<cmd>Gitsigns diffthis<CR>";
    normal."<leader>hp" = "<cmd>Gitsigns preview_hunk<CR>";
    normal."<leader>hn" = "<cmd>Gitsigns next_hunk<CR>";
    normal."<leader>hN" = "<cmd>Gitsigns prev_hunk<CR>";
  };
}
