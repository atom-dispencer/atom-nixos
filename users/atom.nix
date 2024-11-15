{ 
  config,     # The whole config so far
  moduleargs, # Input map from flake.nix, contains nixpkgs home-manager modules etc.
  ...         # The contents of moduleargs, unpacked
}: {
  
  imports = [
    moduleargs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit moduleargs; };
    useGlobalPkgs = true;
    useUserPackages = true;

    users.atom = {
      home.username = "atom";
      home.homeDirectory = "/home/atom/";
      home.stateVersion = "24.05";

      home.packages = with moduleargs.nixpkgs; [
      ];
    programs = import ./programs;

    };

  };
}
