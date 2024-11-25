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

  outputs = { self, nixpkgs, home-manager, nixvim, nixos-wsl, ... } @ inputs: let
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
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        system = "x86_64-linux"; # Henceforth, nixpkgs is automagically available as 'pkgs'
        modules = [
          nixos-wsl.nixosModules.wsl
          home-manager.nixosModules.home-manager
          ./system/system.nix

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [
                nixvim.homeManagerModules.nixvim
              ];
              users.atom = {
                imports = [
                  ./users/atom.nix
                ];
              };
            };
          }
        ];
      };
    };
  };
}
