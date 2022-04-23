{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";

      window.padding = {
        x = 8;
        y = 8;
      };
      font = {
        # gg&&
        normal.family = "Iosevka Nerd Font";
        size = 12;
      };
    };
  };
}
