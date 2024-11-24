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
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        PROMPT=boop > 
      '';

      #oh-my-zsh = {
      #  enable = true;
      #  plugins = [
      #    "git"
      #  ];
      #};
    };
  };

  home.stateVersion = "24.05";
}
