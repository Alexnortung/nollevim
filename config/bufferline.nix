{
  plugins.bufferline =
    let
      closeCommand = "Bdelete! %d";
    in
    {
      enable = true;
      settings = {
        options = {
          indicator.icon = "▎";
          close_command = closeCommand;
          middle_mouse_command = closeCommand;
          right_mouse_command = null;
        };
      };
    };
}
