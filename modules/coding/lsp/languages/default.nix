{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nollevim.coding.lsp-nvim.languages;
in
{
  imports = [
    ./openscad.nix
  ];

  options.nollevim.coding.lsp-nvim.languages = {
  };
}
