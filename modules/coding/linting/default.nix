{ lib, config, pkgs, ... }:

let
  cfg = config.nollevim.coding.linting;
in
{
  options.nollevim.coding.linting = {
    enable = lib.mkEnableOption "Enable linting";
  };

  config = lib.mkIf cfg.enable {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        c = [ "cpplint" ];
        cpp = [ "cpplint" ];
        go = [ "golangci-lint" ];
        nix = [ "statix" ];
        lua = [ "selene" ];
        python = [ "flake8" ];
        javascript = [ "eslint_d" ];
        javascriptreact = [ "eslint_d" ];
        typescript = [ "eslint_d" ];
        typescriptreact = [ "eslint_d" ];
        json = [ "jsonlint" ];
        java = [ "checkstyle" ];
        haskell = [ "hlint" ];
        bash = [ "shellcheck" ];
      };
    };
  };
}
