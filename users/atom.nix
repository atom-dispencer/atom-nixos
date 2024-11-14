{ config, pkgs, inputs, ... }: {
  
  imports = [
    ./packages
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;

    # Configure atom user
    users.atom = {
      home.username = "atom";
      home.homeDirectory = "/home/atom";
      home.stateVersion = "24.05";

      home.packages = with pkgs; [
      ];

      programs = import ./packages;
      programs.home-manager.enable = true;

      #programs = {
      #  home-manager.enable = true;

      #  git = {
      #    enable = true;
      #    userName = "Adam Spencer";
      #  };
      #};
    };
  };
}
