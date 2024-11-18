{ inputs, ... }:

{
  imports = [
    inputs.Neve.nixvimModule
    ./colorscheme
    ./lsp
    ./ui
    ./utils

    ./keymaps.nix
    ./settings.nix
  ];
}
