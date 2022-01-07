{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableSyntaxHighlighting = true;
  };
}
