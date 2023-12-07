{
  enableMan = false;

  # Import all your configuration modules here
  imports = [
    ./appearance/colorscheme.nix
    ./appearance/scrollbar.nix
    ./appearance/treesitter.nix
    ./misc

    # Files
    ./autopairs.nix
    ./basic-plugins.nix
    ./bufferline.nix
    ./commenting.nix
    ./completion.nix
    ./copilot.nix
    ./extra-syntax-highlight.nix
    ./globals.nix
    ./git.nix
    ./keymaps.nix
    ./leap.nix
    ./lsp.nix
    ./markdown.nix
    ./formatting.nix
    ./nvim-tree.nix
    ./options.nix
    ./snippets.nix
    ./surround.nix
    ./telescope.nix
    # ./terminal.nix
    ./which-key.nix
  ];
}
