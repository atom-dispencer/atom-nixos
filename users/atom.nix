{ 
  inputs,
  pkgs,
  ...
}: {

  imports = [
    ./programs
  ];

  home = {
    username = "atom";
    homeDirectory = "/home/atom";
    
    packages = with pkgs; [
      # Core tooling
      clang

      # Shell
      oh-my-zsh
    ];
  };

  home.stateVersion = "24.05";
}
