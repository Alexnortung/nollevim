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
      autoCmd = null;
      lintersByFt = {
        c = [ "cpplint" ];
        cpp = [ "cpplint" ];
        go = [ "golangci-lint" ];
        nix = [ "statix" ];
        lua = [ "selene" ];
        python = [ "flake8" ];
        javascript = [ "eslint_d" "biomejs" ];
        javascriptreact = [ "eslint_d" "biomejs" ];
        typescript = [ "eslint_d" "biomejs" ];
        typescriptreact = [ "eslint_d" "biomejs" ];
        json = [ "jsonlint" "biomejs" ];
        java = [ "checkstyle" ];
        haskell = [ "hlint" ];
        bash = [ "shellcheck" ];
      };
    };
  };
}
