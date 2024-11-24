{ 
  pkgs,
  ...
}: {

  home.username = "atom";
  home.homeDirectory = "/home/atom";

  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [];
      theme = "agnoster";
    };
  };

  home.stateVersion = "24.05";
}
