{pkgs, ...}: {
  extraPlugins = with pkgs; [
    yuck-vim
    futhark-vim # Futhark programming language
  ];
}
