{
  # https://nixos-and-flakes.thiscute.world/nixos-with-flakes/start-using-home-manager 
  description = "Core flake for atom-nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nikpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/nixos-wsl";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { 
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixos-wsl,
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
