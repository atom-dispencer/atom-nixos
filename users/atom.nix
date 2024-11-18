{ 
  config,     # The whole config so far
  home-manager,
  inputs,     # Input map from flake.nix, contains nixpkgs home-manager modules etc.
  ...         # The contents of moduleargs, unpacked
}: {
  
  imports = [
    home-manager.nixosModules.default
  ];

  #
  #
  #
  home-manager = {

    #
    # User configuration
    #
    users.atom = {
      home.username = "atom";
      home.homeDirectory = "/home/atom/";
      home.stateVersion = "24.05";

      home.packages = with moduleargs.nixpkgs; [
      ];
    };

    #
    # Home Manager configuration
    #
    home = {
      extraSpecialArgs = { inherit inputs; };
      useGlobalPkgs = true;
      useUserPackages = true;

      #file = {};
      #packages = {};
    };

    #
    # Program configuration
    #
    programs = {
      home-manager.enable = true;
      git.enable = true;
      fish.enable = true;
      nixvim.enable = true;
    };
  };
}
