{pkgs, ...}: {
  treesitter = {
    enable = true;
    nixGrammars = true;
    indent = true;
    ensureInstalled = "all";
  };

  extraPlugins = with pkgs; [
    nvim-ts-rainbow # treesitter color brackets
    nvim-ts-autotag
  ];
}
