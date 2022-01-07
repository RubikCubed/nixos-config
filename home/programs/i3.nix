{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "${pkgs.alacritty}/bin/alacritty";
      colors = let repeatColor = color: {
        border = color;
        background = color;
        text = color;
        childBorder = color;
        indicator = color;
      }; in rec {
        focused = repeatColor "#bbbbbb";
        focusedInactive = repeatColor "#44475a";
        urgent = repeatColor "#bd93f9";
        unfocused = focusedInactive;
      };
      gaps = {
        inner = 10;
        outer = 0;
      };
      fonts.size = 2.0;
      defaultWorkspace = "workspace number 1";
      focus.newWindow = "focus";
    };
  };
}
