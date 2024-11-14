{ config, pkgs, inputs, ... }: {
  
  imports = [
    ../packages
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    # Configure atom user
    users.atom = {
      home.username = "atom";
      home.homeDirectory = "/home/atom";
      home.stateVersion = "24.05";

      home.packages = with pkgs; [
      ];
    };
  };
}
