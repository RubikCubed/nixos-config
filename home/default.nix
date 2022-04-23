{ pkgs, ... }:

{
  imports = [
#    ./programs/i3.nix
    ./programs/xmonad.nix
    ./programs/neovim.nix
    ./programs/vscode.nix
    ./programs/alacritty.nix
    ./programs/zsh
  ];

  programs.home-manager.enable = true;
  programs = {
    fzf.enable = true;
    fzf.enableZshIntegration = true;
    steam.enable = true;
  };

  xsession = {
    enable = true;
    initExtra = ''
      xrandr --output DP-2 --primary --mode 1920x1080 --rate 144 --left-of DP-4 --output DP-4 --mode 1920x1080 --rate 144
    '';
  };

  home = {
    username = "spider";
    homeDirectory = "/home/spider";
    stateVersion = "21.11";
    packages = with pkgs; [
      bat
      exa
      git
      discord
      dmenu
      firefox
      haskell-language-server
      htop
      (nerdfonts.override {
        fonts = [ "Iosevka" ];
      })
    ];
  };
}
