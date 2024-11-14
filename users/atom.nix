{ pkgs, ... }: {
  
  imports = [
    ../packages
  ];

  home.username = "atom";
  home.homeDirectory = "/home/atom";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
  ];
}
