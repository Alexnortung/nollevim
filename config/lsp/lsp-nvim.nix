{ lib, ... }:

let f = lib.mkForce;
in
{
  lsp-nvim.enable = true;

  # plugins.lsp.keymaps = { lspBuf = { "<C-k>" = f { }; }; };
}
