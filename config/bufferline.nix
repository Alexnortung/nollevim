{
  plugins.bufferline =
    let
      closeCommand = "Bdelete! %d";
    in
    {
      inherit closeCommand;
      enable = true;
      rightMouseCommand = null;
      middleMouseCommand = closeCommand;
      indicator.icon = "▎";
    };
}
