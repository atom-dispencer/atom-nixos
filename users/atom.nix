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

      # Languages
      python313
      nodejs_22
      ghc
      cabal-install

      # Shell
      oh-my-zsh
    ];
  };

  home.stateVersion = "24.05";
}
