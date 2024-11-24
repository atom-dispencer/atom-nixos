{ 
  pkgs,
  ...
}: {

  home.username = "atom";
  home.homeDirectory = "/home/atom";

  programs.zsh = {
    enable = true;
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
