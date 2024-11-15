{ config, pkgs, args, ... }: let
  hm = args.home-manager;
in {
  
  imports = [
    hm.nixosModules.default
  ];

  hm.extraSpecialArgs = { inherit args; };
  hm.useGlobalPkgs = true;
  hm.useUserPackages = true;

  hm.users.atom = let
    username = "atom";
  in {
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "24.05";

    home.packages = with pkgs; [
    ];

    programs = import ./programs;
  };
}
