{ pkgs, ... }:
{
  programs.neovim = {
    package = (builtins.getFlake "github:nixos/nixpkgs/78cd22c1b8604de423546cd49bfe264b786eca13").legacyPackages.x86_64-linux.neovim-unwrapped;
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      vim-nix
    ];
    extraPackages = with pkgs; [ rnix-lsp ];
    extraConfig = ''
      lua << EOF
      local lspc = require('lspconfig')
      lspc.rnix.setup{}
      EOF
    '';
  };
}
