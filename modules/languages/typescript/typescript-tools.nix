{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.nollevim.languages.typescript.typescript-tools;
in
{
  options.nollevim.languages.typescript.typescript-tools = {
    enable = lib.mkEnableOption "Enable typescript-tools.nvim";
  };

  config = lib.mkIf cfg.enable {
    plugins.typescript-tools = {
      enable = lib.mkDefault false;

      settings = lib.mkDefault {
        tsserver_path = "${pkgs.vtsls}/bin/vtsls";

        tsserver_file_preferences = {
          vtsls = {
            enableMoveToFileCodeAction = true;
            autoUseWorkspaceTsdk = true;
          };
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
              includeInlayVariableTypeHintsWhenTypeMatchesName = true;
            };
          };
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
              includeInlayVariableTypeHintsWhenTypeMatchesName = true;
            };
          };
        };
      };
    };
  };
}
