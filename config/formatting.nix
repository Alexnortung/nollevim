{ pkgs, ... }: {
  plugins.null-ls = {
    enable = true;
    sources.formatting = {
      prettier.enable = true;
      # prettier_d_slim.enable = true;
      # eslint_d.enable = true;
      # eslint.enable = true;
      alejandra.enable = true;
      # phpcbf.enable = true;
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
  ];
  extraPackages = with pkgs; [
    # nodePackages.prettier
  ];

  plugins.lsp-format = {
    enable = true;
  };
}
