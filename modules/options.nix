{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.options;
in
{
  options.nollevim.options = {
    enable = lib.mkEnableOption "Enable nollevim default options";
    tabSize = lib.mkOption {
      type = lib.types.int;
      default = 4;
      description = "The number of spaces a tab is equal to";
    };
  };

  config = lib.mkIf cfg.enable {
    globals = {
      mapleader = lib.mkDefault " ";
    };

    opts = {
      number = lib.mkDefault true; # sets numbers in the side
      relativenumber = lib.mkDefault true; # makes side numbers relative to the cursor
      expandtab = lib.mkDefault true; # nicer default tabs
      clipboard = lib.mkDefault "unnamedplus"; # use system clipboard
      mouse = "a"; # make neovim usable with mouse
      smartcase = lib.mkDefault true; # "smart" search
      ignorecase = lib.mkDefault true;
      splitbelow = lib.mkDefault true;
      splitright = lib.mkDefault true;
      shiftwidth = lib.mkDefault cfg.tabSize;
      tabstop = lib.mkDefault cfg.tabSize;
      cursorline = lib.mkDefault true;
      smartindent = lib.mkDefault true;
      scrolloff = lib.mkDefault 4; # keeps lines above and below
    };
  };
}
