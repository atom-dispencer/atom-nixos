{
  # https://nixos-and-flakes.thiscute.world/nixos-with-flakes/start-using-home-manager 
  description = "Core flake for atom-nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-wsl.url = "github:nix-community/nixos-wsl";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    }
  };

  outputs = { self, nixpkgs, home-manager, nixos-wsl, ... }: {
    
    # nixos here is the default name
    # I only have one config so it doesnt matter
    # Could be changed to .atom-nix, but would need to use:
    #   nixos-rebuild switch --flake .#atom-nix
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        nixos-wsl.nixosModules.wsl

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.atom = import ./users/atom.nix;
        }
      ];
    };
  };
}
