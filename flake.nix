{
  # https://nixos-and-flakes.thiscute.world/nixos-with-flakes/start-using-home-manager 
  description = "Core flake for atom-nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-wsl.url = "github:nix-community/nixos-wsl";

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl = {
      url = "github:nix-community/nixGL";
    };
  };

  outputs = { 
    self,
    nixpkgs,
    home-manager,
    nixos-wsl,
    nix-ld,
    nixgl,
    ... 
  } @ inputs: let
    inherit (self) outputs;
  in {
    
    #
    # System (NixOS) configuration
    #
    nixosConfigurations = {

      # nixos here is the default name
      # I only have one config so it doesnt matter
      # Could be changed to .atom-nix, but would need to use:
      #   nixos-rebuild switch --flake .#atom-nix

      # Default system configuration (WSL)
      wsl = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        system = "x86_64-linux"; # Henceforth, nixpkgs is automagically available as 'pkgs'
        modules = [
          nixos-wsl.nixosModules.wsl
          home-manager.nixosModules.home-manager
          nix-ld.nixosModules.nix-ld
          ./system/wsl.nix
        ];
      };
    };

    homeConfigurations = {
      popos = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { 
          system = "x86_64-linux";
          overlays = [ nixgl.overlay ];
        };
        modules = [
          ./home/atom.nix
          ./home/atom-popos.nix
        ];
      };
    };
  };
}
