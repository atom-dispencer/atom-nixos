{
  # https://nixos-and-flakes.thiscute.world/nixos-with-flakes/start-using-home-manager 
  description = "Core flake for atom-nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-wsl.url = "github:nix-community/nixos-wsl";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    
    # nixos here is the default name
    # I only have one config so it doesnt matter
    # Could be changed to .atom-nix, but would need to use:
    #   nixos-rebuild switch --flake .#atom-nix

    nixosConfigurations = {

      # Default (WSL)
      nixos = nixpkgs.lib.nixosSystem {
        extraSpecialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./users/atom.nix
          inputs.nixos-wsl.nixosModules.wsl
          inputs.home-manager.nixosModules.default
        ];
      };

      # Another configuration could go here :)
    };
  };
}
