{ 
  pkgs,
  ...
}: {

  home = {
    username = "atom";
    homeDirectory = "/home/atom";
    
    packages = with pkgs; [
      oh-my-zsh
    ];
  };

  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [];
        theme = "agnoster";
      };
    };
  };

  home.stateVersion = "24.05";
}
