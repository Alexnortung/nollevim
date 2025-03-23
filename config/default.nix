{
  enableMan = false;

  # Import all your configuration modules here
  imports = [
    ../modules

    ./appearance/colorscheme
    ./appearance/scrollbar.nix
    ./misc

    # # Files
    ./keymaps.nix
  ];
}
