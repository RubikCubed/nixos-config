{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

#    neovim = {
#      url = "github:neovim/neovim?dir=contrib";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };

#    rnix-lsp = {
#      url = "github:nix-community/rnix-lsp";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: 
  let 
    system = "x86_64-linux";
 #   overlays = [
 #     (final: prev: {
 #       rnix-lsp = inputs.rnix-lsp.defaultPackage."${system}";
 #     })
 #   ];
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
        inherit system;
        specialArgs = {
          inherit nixpkgs;
        };
        modules = [
          { 
            nixpkgs = { 
	      #inherit overlays;
              config.allowUnfree = true;
            }; 
          }
          ./system
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.spider = import ./home;
              extraSpecialArgs = {
                inherit inputs;
              };
            };
          }
        ];
      };
    };
  }
