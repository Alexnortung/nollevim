{ lib, ... }:

{
  colorschemes.enable = true;
  catppuccin.enable = true;

  colorschemes.catppuccin = {
    settings = {
      background = {
        light = lib.mkForce "frappe";
        dark = lib.mkForce "mocha";
      };

      transparent_background = lib.mkForce false;
    };
  };
}
