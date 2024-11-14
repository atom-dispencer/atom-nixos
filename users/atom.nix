{ config, pkgs, args, ... }: {
  
  imports = [
    args.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit args; };
    useGlobalPkgs = true;
    useUserPackages = true;

    # Configure atom user
    users.atom = {
      home.username = "atom";
      home.homeDirectory = "/home/atom";
      home.stateVersion = "24.05";

      home.packages = with pkgs; [
      ];

      programs = import ./programs;
    };
  };
}
