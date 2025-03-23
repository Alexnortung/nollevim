{
  enableMan = false;

  # Import all your configuration modules here
  imports = [
    ../modules

    ./appearance/colorscheme
    ./appearance/scrollbar.nix
    # ./appearance/treesitter.nix
    ./misc

    # # Files
    # ./basic-plugins.nix
    # ./commenting.nix
    # ./completion.nix
    ./globals.nix
    ./keymaps.nix
    # ./leap.nix
    # ./lsp.nix
    # ./markdown.nix
    # ./formatting.nix
    # ./nvim-tree.nix
    # ./options.nix
    # ./session.nix
    # ./snippets.nix
    # ./surround.nix
    # ./telescope.nix
    # # ./terminal.nix
    # ./which-key.nix
  ];
}
