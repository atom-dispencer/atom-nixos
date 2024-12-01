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

      # Shell environment
      oh-my-zsh

      # Haskell
      ghc
      cabal-install
      haskell-language-server
      # JS
      nodejs_22
      # Lua
      luarocks-nix
      # Matlab
      matlab-language-server
      # Python
      python313
    ];
  };

  home.stateVersion = "24.05";
}
