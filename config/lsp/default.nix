{ lib, ... }:
let f = lib.mkForce;
in {
  imports = [ ./lsp-nvim.nix ./none-ls.nix ];

  plugins.none-ls = {
    settings = { };
    sources = { formatting = { }; };
  };
}
