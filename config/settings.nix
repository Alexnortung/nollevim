{ lib, ... }:

let f = lib.mkForce;
in {
  config = {
    opts = {
      number = true; # sets numbers in the side
      relativenumber = true; # makes side numbers relative to the cursor
      expandtab = true; # nicer default tabs
      clipboard = "unnamedplus"; # use system clipboard
      mouse = "a"; # make neovim usable with mouse
      smartcase = true; # "smart" search
      ignorecase = true;
      splitbelow = true;
      splitright = true;
      shiftwidth = f 4;
      tabstop = f 4;
      cursorline = f true;
      smartindent = true;
      scrolloff = f 4; # keeps lines above and below
      colorcolumn = f null;
      guicursor = f null;
      listchars = f "tab:|->,space: ,trail:•,extends:→,precedes:←,nbsp:␣";
    };
  };
}
