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

      # Lua
      luarocks-nix
      # Python
      python313
      # JS
      nodejs_22
      # Haskell
      ghc
      cabal-install
      haskell-language-server

      # Shell
      oh-my-zsh
    ];
  };

  home.stateVersion = "24.05";
}
