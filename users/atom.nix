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
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      ohMyZsh = {
        enable = true;
        plugins = [];
        theme = "cloud";
      };
    };
  };

  home.stateVersion = "24.05";
}
