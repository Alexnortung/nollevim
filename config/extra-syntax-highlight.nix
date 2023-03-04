{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    yuck-vim
    futhark-vim # Futhark programming language
    Jenkinsfile-vim-syntax
  ];
}
