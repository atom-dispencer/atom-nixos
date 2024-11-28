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
      gcc

      # Languages
      python313
      nodejs_22
      ghc
      stack
      cabal-install
      haskell-language-server
      haskell-debug-adapter
      luarocks-nix

      # Shell
      oh-my-zsh
    ];
  };

  home.stateVersion = "24.05";
}
