{ config, pkgs, home-manager, ... }: {
  
  imports = [
    args.home-manager.nixosModules.default
  ];

  home-manager.extraSpecialArgs = { inherit args; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.atom = let
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
