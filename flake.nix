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
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, nixos-wsl, ... } @ args: let
    inherit (self) outputs;
  in {
    
    # nixos here is the default name
    # I only have one config so it doesnt matter
    # Could be changed to .atom-nix, but would need to use:
    #   nixos-rebuild switch --flake .#atom-nix

    nixosConfigurations = {

      # Default system configuration (WSL)
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit args; };
        system = "x86_64-linux";
        modules = [
          ./system/system.nix
          nixos-wsl.nixosModules.wsl
        ];
      };

      # Another configuration could go here :)
    };

    homeConfigurations = {
      "atom@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit args outputs; };
        modules = [./users/atom.nix];
      };
    };
  };
}
