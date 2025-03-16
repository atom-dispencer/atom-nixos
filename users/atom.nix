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

    shellAliases = {
      ex = "explorer.exe ."
    };

    # ~ twiddlin my thumbs ~
    
    packages = with pkgs; [
      # Shell environment
      oh-my-zsh
      neofetch

      # Haskell
      ghc
      cabal-install
      haskell-language-server
      # JS
      nodejs_22
      # Julia
      julia_19-bin
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
