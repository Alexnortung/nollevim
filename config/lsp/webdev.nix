{ pkgs, ... }:

{
  plugins.lsp.servers = {
    # vuels = {
    #   enable = true;
    #   # package = pkgs.nodePackages.vls;
    #   # package = pkgs.vue-language-server;
    # };
    volar = {
      enable = true;
      tslsIntegration = true;
    };
    ts_ls = {
      enable = true;
      filetypes = [ "javascript" "typescript" "vue" ];
      extraOptions = {
        # init_options = {
        #   plugins = [{
        #     name = "@vue/typescript-plugin";
        #     # location = pkgs.vue-language-server;
        #     location = pkgs.vscode-extensions.vue.vscode-typescript-vue-plugin;
        #     languages = [ "javascript" "typescript" "vue" ];
        #   }];
        # };
      };
    };
  };
}
